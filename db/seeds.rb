# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.find_or_create_by!(email_address: ENV.fetch("ADMIN_EMAIL", "isaac@example.com")) do |user|
  user.password = ENV.fetch("ADMIN_PASSWORD", "password")
end

Post.create!(
  title: "Hello Big World",
  description: "This is a test post.",
  author: "Mr Seed.",
  content: "<p>This is a test post.</p>",
  published_at: Date.today,
  category: "project",
)

Post.create!(
  title: "Hello Small World",
  description: "This is a test post.",
  author: "Mr Seed.",
  content: "<p>This is a test post.</p>",
  published_at: Date.today,
  category: "small",
)

Post.create!(
  title: "Goodbye Small World",
  description: "This is a test post.",
  author: "Mr Seed.",
  content: "<p>This is a test post.</p>",
  category: "small",
)
