require 'test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  setup do
    @deploy = deploys(:one)
    @project = @deploy.project
  end

  test "should get create" do
    assert_difference 'Attachment.count', 1 do
      get :create, project_id: @project,
        deploy_id: @deploy,
        attachment: { data: { speedIndex: 1023 } }
    end
  end
end
