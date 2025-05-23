# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.production?

  standard_user = User.where(email: ENV['HOMEY_USER_EMAIL']).first_or_initialize

  standard_user.update!(
    first_name: "Homey",
    last_name: "User",
    password: ENV['HOMEY_USER_PASSWORD'],
    password_confirmation: ENV['HOMEY_USER_PASSWORD']
  )

  admin_user = User.where(email: ENV['HOMEY_ADMIN_EMAIL']).first_or_initialize

  admin_user.update!(
    first_name: "Homey",
    last_name: "Admin",
    password: ENV['HOMEY_ADMIN_PASSWORD'],
    password_confirmation: ENV['HOMEY_ADMIN_PASSWORD']
  )

else
  user = User.where(email: "testuser@gmail.com").first_or_initialize
  user.update!(
    first_name: "Steven",
    last_name: "Klavins",
    password: 'password',
    password_confirmation: 'password'
  )

  admin_user = User.where(email: "testadmin@gmail.com").first_or_initialize
  admin_user.update!(
    first_name: "Steven",
    last_name: "Klavins",
    password: 'password',
    password_confirmation: 'password',
    admin: true
  )
end
