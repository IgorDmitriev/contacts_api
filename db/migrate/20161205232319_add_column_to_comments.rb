class AddColumnToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :target, polymorphic: true, index: true

    add_column :comments, :user_id, :integer, null: false, index: true
    add_column :comments, :text, :text, null: false
  end
end
