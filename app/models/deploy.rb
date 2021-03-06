class Deploy < ActiveRecord::Base
  serialize :sha, SHA

  belongs_to :project

  has_many :attachments, dependent: :destroy

  validates :project, presence: true
  validates :occurred_at, presence: true
  validates :environment, presence: true

  scope :recent, -> { order(occurred_at: "DESC").limit(5) }

  def add_attachment(data)
    attachment = Attachment.new(deploy: self, data: data)

    self.attachments << attachment

    attachment
  end
end
