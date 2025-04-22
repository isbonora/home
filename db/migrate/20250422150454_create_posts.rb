class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :status
      t.string :category

      t.timestamps
    end
  end
end
