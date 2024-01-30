class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.boolean :likes

      t.timestamps
    end
  end
end
