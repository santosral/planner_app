require "test_helper"

class SharedControllerTest < ActionDispatch::IntegrationTest
  test "should get navbar" do
    get shared_navbar_url
    assert_response :success
  end
end
