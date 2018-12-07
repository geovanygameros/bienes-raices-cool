#coding:utf-8
desc "Actualiza las propiedades desde una url"
task :update_properties => :environment do
  #Como la url viene en gzip, primero hay que descomprimir el contenido para leer el xml completo
  url = "http://www.stagingeb.com/feeds/d420256874ddb9b6ee5502b9d54e773d8316a695/trovit_MX.xml.gz"
  stream = open(url, 'Accept-Encoding' => 'gzip')
  data = Zlib::GzipReader.new(stream).read
  doc = Nokogiri::XML(data)
  objects = doc.xpath("//ad")

  properties_ids = [] # En este array se almacenarán los ids de las propiedades que se encuentren en el xml
  pictures_ids = [] # En este array se almacenarán los ids de las imágenes que se encuentren en el xml

  objects.each do |object|
    property = Property.find_by(easy_broker_id: object.css("id").text)
    if !property
      property = Property.new(easy_broker_id: object.css("id").text) # Si se encuentra la propiedad la actualiza, si no la crea
    end
    property.content = object.css("content").text if object.css("content")
    property.status = Property::ACTIVE
    property.property_type = object.css("property_type").text if object.css("property_type")
    property.bussiness_type = object.css("type").text if object.css("type")
    property.title = object.css("title").text if object.css("title")
    property.price = object.css("price").text if object.css("price")
    property.rooms = object.css("rooms").text if object.css("rooms")
    if property.save
      properties_ids.push(property.id)
    end

    # Busca las imágenes, si no las encuentra las crea
    object.css("picture_url").each do |picture_url|
      picture = PropertyPicture.find_by(picture_url:picture_url.text)
      if !picture
        picture = property.property_pictures.new
        picture.remote_picture_url = picture_url.text
        picture.picture_url = picture_url.text
      end
      if picture.save
        pictures_ids.push(picture.id)
      end
    end

  end
  Property.where.not(id:properties_ids).update(status: Property::DELETED) # Se marcan como eliminados los registros no encontrados en el xml
  PropertyPicture.where.not(id:pictures_ids).destroy_all # Se eliminan de forma permanente las imágenes que no están en el xml
end