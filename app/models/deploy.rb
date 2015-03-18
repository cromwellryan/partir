class Deploy < ActiveRecord::Base
  belongs_to :project

  has_many :attachments, dependent: :destroy

  validates :project, presence: true
  validates :occurred_at, presence: true
  validates :environment, presence: true

  scope :recent, -> { order(occurred_at: "DESC").limit(5) }

  def add_attachment(data)
    Attachment.new deploy: self, data: data
  end
end
