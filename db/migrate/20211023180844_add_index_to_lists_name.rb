class AddIndexToListsName < ActiveRecord::Migration[6.1]
  def change
    add_index :lists, :name, unique: true
  end
end
