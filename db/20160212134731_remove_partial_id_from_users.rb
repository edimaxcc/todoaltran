class RemovePartialIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :partial_id
  end
end
