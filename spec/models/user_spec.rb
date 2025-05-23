require 'rails_helper'

RSpec.describe User, type: :model do
  it "allows a valid user to be created" do
    user = User.new(
      first_name: "Jon",
      last_name: "Doe",
      email: "test2@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to be_valid
  end

  it "validates for first name" do
    user = User.new(
      last_name: "Doe",
      email: "test3@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to_not be_valid
  end

  it "validates for last name" do
    user = User.new(
      first_name: "Jon",
      email: "test3@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to_not be_valid
  end
end
