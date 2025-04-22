class AddRedirectLinkToPosts < ActiveRecord::Migration[8.0]
  def change
    # Optional link to redirect to external content.
    add_column :posts, :redirect_link, :string
  end
end
