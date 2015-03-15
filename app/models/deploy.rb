class Deploy < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: true
  validates :occurred_at, presence: true
  validates :environment, presence: true
end
