require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get purchases" do
    get home_purchases_url
    assert_response :success
  end

  test "should get history" do
    get home_history_url
    assert_response :success
  end

  test "should get favorites" do
    get home_favorites_url
    assert_response :success
  end

end
