class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :genre, :string
    add_column :users, :photo, :string
    add_column :users, :barman, :boolean
    add_column :users, :birthday, :integer
  end
end
