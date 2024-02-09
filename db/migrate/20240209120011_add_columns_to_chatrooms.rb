class AddColumnsToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :artisan_id, :integer
    add_column :chatrooms, :client_id, :integer
  end
end
