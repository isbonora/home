desc "Setup slugs for every post based on title."
task sluggify_posts: :environment do
  Post.where(slug: "").each do |post|
    post.update(slug: post.title.parameterize)
  end
end
