require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project = Project.new name: 'partir'
  end

  test 'validates presence of name' do
    @project.name = nil
    assert_not @project.save, 'saving without name'
  end

  test "creates tokens on save" do
    @project.save!
    refute_nil @project.token
  end

  test 'token is 32 characters long' do
    @project.save
    assert_equal 32, @project.token.length
  end
end
