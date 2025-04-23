class RemoveStatusFromPost < ActiveRecord::Migration[8.0]
  def change
    remove_column :posts, :status
  end
end
