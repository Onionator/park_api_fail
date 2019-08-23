class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :directions
      t.text :description
      t.string :name
      t.string :states
      t.string :website
    end
  end
end
