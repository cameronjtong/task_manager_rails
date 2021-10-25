class AddIndexToListsName < ActiveRecord::Migration[6.1]
  def change
    add_index :lists, [:user_id, :name], unique: true
  end
end
