require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"  #Rails7 3章　リスト3.32 
  end

  test "should get root" do #Rails7 3章　リスト3.44
    get root_url
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
    #assert_select "title", "Home | #{@base_title}"  #Rails7 3章　リスト3.32 
    assert_select "title" , "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"  #Rails7 3章　リスト3.32
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}" #Rails7 3章　リスト3.32
  end

 test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}" #Rails7 3章　リスト3.42
  end

end
