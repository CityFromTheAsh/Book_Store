require 'test_helper'

class PasteboardControllerTest < ActionDispatch::IntegrationTest
  test "should get home," do
    get pasteboard_home,_url
    assert_response :success
  end

  test "should get about," do
    get pasteboard_about,_url
    assert_response :success
  end

  test "should get contact" do
    get pasteboard_contact_url
    assert_response :success
  end

end
