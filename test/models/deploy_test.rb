require 'test_helper'

class DeployTest < ActiveSupport::TestCase
  def setup
    @deploy = Deploy.new({
      project: Project.new,
      occurred_at: DateTime.now
    })
  end

  test 'requires a project' do
    @deploy.project = nil
    assert_not @deploy.save
  end

  test 'requires occurred_at' do
    @deploy.occurred_at = nil
    assert_not @deploy.save
  end
end
