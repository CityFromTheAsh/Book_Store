require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get buyed" do
    get user_buyed_url
    assert_response :success
  end

  test "should get sold" do
    get user_sold_url
    assert_response :success
  end

  test "should get reviews" do
    get user_reviews_url
    assert_response :success
  end

end
