class Todo < ApplicationRecord
  belongs_to :project

  validates :text, :project_id, presence: true
end
