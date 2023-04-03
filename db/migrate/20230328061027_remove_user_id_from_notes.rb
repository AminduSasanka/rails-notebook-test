class RemoveUserIdFromNotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :user_id, :integer
  end
end
