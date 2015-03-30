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
    assert_difference(-> {@project.deploys.count}, 1) do
      post :create, project_id: @project, deploy: { sha: 'abc123', environment: 'development' }
    end
  end

  test 'can embed attachments' do
    post :create, project_id: @project, deploy: { sha: 'abc123', environment: 'test',
                attachments: [
                  { speedIndex: 1023 },
                  { speedIndex: 1024 }
                ]
      }

    assert_equal(2, @project.deploys.last.attachments.count)
  end

  test 'can include json fragments' do
    post :create, project_id: @project, deploy: { environment: 'test', 
                                                  performance: { speedIndex: 1092 }
                                        }

    @project.deploys.last
  end
end
