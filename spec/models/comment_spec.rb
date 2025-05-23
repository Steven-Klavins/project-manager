require 'rails_helper'

RSpec.describe Comment, type: :model do

  before :all do
    @project = Project.create!(
      name: "Ruby",
      status: 1,
      description: "A Cool Project"
    )

    @user = User.create!(
      first_name: "Jon",
      last_name: "Doe",
      email: "test@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "allows a user create a valid comment" do
    comment = Comment.new(
      body: "Body Text",
      user_id: @user.id,
      project_id: @project.id,
      )
    expect(comment).to be_valid
  end

  it "ensures comments must belong to a project" do
    comment = Comment.new(
      body: "Body Text",
      user_id: @user.id,
      )
    expect(comment).to_not be_valid
  end

  it "ensures comments must belong to a user" do
    comment = Comment.new(
      body: "Body Text",
      project_id: @project.id,
      )
    expect(comment).to_not be_valid
  end

  it "validates the body of the comment" do
    comment = Comment.new(
      body: "",
      project_id: @project.id,
      )
    expect(comment).to_not be_valid
  end
end
