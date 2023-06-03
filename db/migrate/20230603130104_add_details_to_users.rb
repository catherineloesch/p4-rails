class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :display_name, :string
    add_column :users, :address, :string
    add_column :users, :description, :string
    add_column :users, :age, :integer
  end
end
