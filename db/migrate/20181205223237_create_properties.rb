class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.text :content
      t.string :easy_broker_id
      t.integer :status
      t.string :property_type
      t.string :title
      t.string :bussiness_type
      t.integer :rooms
      t.integer :price

      t.timestamps
    end
  end
end
