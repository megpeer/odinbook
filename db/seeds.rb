# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(email: 'luke@rebels.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'leia@rebels.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'han@rebels.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'chewbacca@rebels.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'vader@empire.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'palpatine@empire.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'jabba@empire.com',
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'tarkin@empire.com',
    password: 'password',
    password_confirmation: 'password')
