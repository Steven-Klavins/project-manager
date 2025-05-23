class Project < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_rich_text :description
    validates :name, :description, presence: true
    enum :status, { unassigned: 0, pending_approval: 1, in_progress: 2, urgent: 3, complete: 4, abandoned: 5 }
end
