class AddColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :name, :string, null: false
    add_column :contacts, :email, :string, null: false
    add_column :contacts, :user_id, :integer, null: false

    add_index(:contacts, [:user_id, :email], unique: true)
  end
end
