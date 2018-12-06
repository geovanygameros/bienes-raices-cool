class CreatePropertyPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :property_pictures do |t|
      t.references :property, foreign_key: false
      t.string :picture
      t.string :picture_url

      t.timestamps
    end
  end
end
