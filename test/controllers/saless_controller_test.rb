require "test_helper"

class SalessControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get saless_new_url
    assert_response :success
  end
end
