class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.integer :client_id
      t.references :product, null: false, foreign_key: true
      t.boolean :likes

      t.timestamps
    end

    add_foreign_key :lists, :users, column: :client_id

  end
end
