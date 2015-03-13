require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project = Project.new
  end

  test "creates tokens on save" do
    refute_nil @project.token
  end
end
