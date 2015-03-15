require 'test_helper'

class DeploysControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @deploy = deploys(:one)
  end

  test "should get index" do
    get :index, project_id: @project
    assert_response :success
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:deploys)
  end

  test "should create deploy" do
    assert_difference('Deploy.count', 1) do
      post :create, project_id: @project, deploy: { sha: 'abc123', environment: 'development' }
    end
  end
end
