require 'test_helper'

class OwnersControllerTest < ActionController::TestCase
  test "should get dashboard" do
    @owner = create_and_sign_in_owner

    get :dashboard

    assert_response :success

    assert_equal @owner, assigns(:owner)
  end

  test "should not get dashboard for non-owners" do
    get :dashboard

    assert_redirected_to :new_owner_session
  end
end
