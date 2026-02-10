require "rails_helper"

RSpec.describe User, type: :model do
  it "has many posts" do
    assoc = described_class.reflect_on_association(:posts)
    expect(assoc.macro).to eq :has_many
  end
end

# User associations

# Post associations

# Comment associations
