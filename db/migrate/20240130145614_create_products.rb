class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :collection
      t.string :material
      t.string :color

      t.timestamps
    end
  end
end
