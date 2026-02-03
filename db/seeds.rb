# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(email: 'luke@rebels.com', name: "Luke",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'leia@rebels.com', name: "Leia",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'han@rebels.com', name: "Han",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'chewbacca@rebels.com', name: "Chewbacca",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'vader@empire.com', name: "Vader",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'palpatine@empire.com', name: "Palpatine",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'jabba@empire.com', name: "Jabba the Hutt",
    password: 'password',
    password_confirmation: 'password')
User.create!(email: 'tarkin@empire.com', name: "Grand Moff T",
    password: 'password',
    password_confirmation: 'password')
