class Project < ActiveRecord::Base
  tokenize :token, length: 32

  has_many :deploys

  validates :name, presence: true, uniqueness: true

  def record_deploy(options={})
    options.merge! project: self, occurred_at: DateTime.now.utc

    Deploy.new options
  end
end

