require 'rails_helper'

RSpec.describe Project, type: :model do
  it "allows a user create a valid project" do
    comment = Project.new(
      name: "Cool Project",
      status: 2,
      description: "Make a projects platform"
    )
    expect(comment).to be_valid
  end

  it "validates presence of a project description" do
    comment = Project.new(
      name: "Cool Project",
      status: 2,
    )
    expect(comment).to_not be_valid
  end

  it "validates presence of a project name" do
    comment = Project.new(
      status: 2,
      description: "Make a projects platform"
      )
    expect(comment).to_not be_valid
  end

  it "has a default status of unassigned" do
    comment = Project.create!(
      name: "Cool Project",
      description: "Make a projects platform"
    )
    expect(comment.status).to eql("unassigned")
  end
end
