class Project < ActiveRecord::Base
  tokenize :token, length: 32

  validates :name, presence: true, uniqueness: true
end

