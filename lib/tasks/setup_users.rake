desc "Setup default users for the application"
task setup_users: :environment do
  # Create a default user
  user = User.find_or_create_by!(email_address: ENV.fetch("ADMIN_EMAIL", "isaac@example.com")) do |user|
    user.password = ENV.fetch("ADMIN_PASSWORD", "password")
  end

  if user.persisted?
    puts "User already exists: #{user.email_address}"
  else
    puts "Created user: #{user.email_address}"
  end
end
