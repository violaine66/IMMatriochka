require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get approve" do
    get admin_approve_url
    assert_response :success
  end

  test "should get reject" do
    get admin_reject_url
    assert_response :success
  end
end
