class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :address
      t.text :description
      t.float :entrance_fee
      t.string :image_url
      t.string :name
      t.string :states
      t.string :website
      t.timestamps
    end
  end
end
