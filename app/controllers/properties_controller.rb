class PropertiesController < ApplicationController
  def index
    url = "http://www.stagingeb.com/feeds/d420256874ddb9b6ee5502b9d54e773d8316a695/trovit_MX.xml.gz"
    stream = open(url, 'Accept-Encoding' => 'gzip')
    data = Zlib::GzipReader.new(stream).read
    doc = Nokogiri::XML(data)
    properties = doc.xpath("//ad")
    puts properties.first.css("picture_url").last.text
    @total_properties = Property.where.not(status: Property::DELETED).size
  end

  def load_properties
    ###################### Se reciben los parámetros
    properties_loaded = params[:properties_loaded].to_i
    rooms = params[:search_object][:rooms]
    @properties = Property.where.not(status: Property::DELETED)

    respond_to do |format|
      format.html do
        @properties = @properties.offset(properties_loaded).limit(50)
        render layout: false
      end
    end
  end
end
