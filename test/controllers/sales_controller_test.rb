require "test_helper"

class SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sales_new_url
    assert_response :success
  end
end
