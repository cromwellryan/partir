class Attachment < ActiveRecord::Base
  belongs_to :deploy

  validates :deploy, presence: true
end
