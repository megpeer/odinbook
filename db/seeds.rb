ENV["SEEDING"] = "true"

[
  { email: "luke@rebels.com", name: "Luke" },
  { email: "leia@rebels.com", name: "Leia" },
  { email: "han@rebels.com", name: "Han" },
  { email: "chewbacca@rebels.com", name: "Chewbacca" },
  { email: "vader@empire.com", name: "Vader" },
  { email: "palpatine@empire.com", name: "Palpatine" },
  { email: "jabba@empire.com", name: "Jabba the Hutt" },
  { email: "tarkin@empire.com", name: "Grand Moff T" }
].each do |attrs|
  User.find_or_create_by!(email: attrs[:email]) do |user|
    user.name = attrs[:name]
    user.password = "password"
  end
end
