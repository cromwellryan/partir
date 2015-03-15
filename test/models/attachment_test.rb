require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  setup do
    @deploy = deploys(:one)
    @attachment = attachments(:performance)
  end

  test 'requires a deploy' do
    @attachment.deploy = nil
    assert_not @attachment.save, "Saved without a deploy"
  end
end
