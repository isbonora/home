class AddPublishDateToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :published_at, :date
  end
end
