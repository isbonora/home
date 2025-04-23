class AddSlugToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :slug, :string

    Post.reset_column_information
    Post.find_each do |post|
      post.update(slug: post.title.parameterize)
    end

    change_column_null :posts, :slug, false
  end
end
