class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :body, presence: true

  # After a comment is added broadcast the update so anyone viewing the project can see it.
  after_create_commit -> {
    broadcast_append_to "project_#{project.id}_comments", target: "comments", partial: "comments/comment", locals: { comment: self }
  }
end
