require 'test_helper'

class DeployTest < ActiveSupport::TestCase
  def setup
    @deploy = deploys(:one)
  end

  test 'requires a project' do
    @deploy.project = nil
    assert_not @deploy.save, "Saved the deploy without a project"
  end

  test 'requires occurred_at' do
    @deploy.occurred_at = nil
    assert_not @deploy.save, "Saved the deploy without an occurred_at"
  end

  test 'requires environment' do
    @deploy.environment = nil
    assert_not @deploy.save, "Saved the deploy without an environment"
  end

  test 'accepts attachments' do
    attachment = @deploy.add_attachment data: { speedIndex: 1902 }
    assert_equal @deploy, attachment.deploy
  end
end
