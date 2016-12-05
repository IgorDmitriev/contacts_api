class AddColumnToContactShares < ActiveRecord::Migration
  def change
    add_column :contact_shares, :contact_id, :integer, null: false
    add_column :contact_shares, :user_id, :integer, null: false

    add_index(:contact_shares, [:user_id, :contact_id], unique: true)
    add_index(:contact_shares, :contact_id)
  end
end
