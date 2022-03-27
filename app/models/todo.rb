class Todo < ApplicationRecord
  belongs_to :project

  validates :text, :project_id, presence: true

  default_scope { order(:created_at) }
end
