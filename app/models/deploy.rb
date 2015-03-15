class Deploy < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :occurred_at, presence: true
end
