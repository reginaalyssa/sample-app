require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @activated_user = users(:archer)
    @non_activated_user = users(:malory)
  end

  test "should redirect if user account not activated" do
    log_in_as(@admin)
    get user_path(@non_activated_user)
    assert_redirected_to root_url
  end

  test "should show user profile if user account is activated" do
    log_in_as(@admin)
    get user_path(@activated_user)
    assert_template 'users/show'
    assert_select 'h1', @activated_user.name
  end
end
