class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, index: true, null: false
  end
end
