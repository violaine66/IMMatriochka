require "test_helper"

class Admin::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_reservations_index_url
    assert_response :success
  end

  test "should get approve" do
    get admin_reservations_approve_url
    assert_response :success
  end

  test "should get reject" do
    get admin_reservations_reject_url
    assert_response :success
  end
end
