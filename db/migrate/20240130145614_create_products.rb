class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :collection
      t.string :material
      t.string :color
      t.integer :craftman_id

      t.timestamps
    end
    add_foreign_key :products, :users, column: :craftman_id
  end
end
