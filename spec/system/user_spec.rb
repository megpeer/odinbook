# spec/models/user_spec.rb
require "rails_helper"

RSpec.describe User, type: :model do
  it "has many posts" do
    expect(described_class.reflect_on_association(:posts).macro).to eq :has_many
  end

  it "can access associated posts" do
    user = create(:user)
    post = create(:post, user: user)
    expect(user.posts).to include(post)
  end

   it "has many comments" do
    expect(described_class.reflect_on_association(:comments).macro).to eq :has_many
  end

  it "can access associated coments" do
    user = create(:user)
    post = create(:post, user: user)
    comment = create(:comment, post: post, user: user)
    expect(user.comments).to include(comment)
  end

     it "can have many friends" do
    expect(described_class.reflect_on_association(:likes).macro).to eq :has_many
  end

  it "can access active connections" do
    user = create(:user)
    other_user = create(:user)
    connection = create(:connection, follower: user, followee: other_user)
    expect(user.active_connections).to include(connection)
  end
end
