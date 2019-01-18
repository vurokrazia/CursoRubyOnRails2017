require 'test_helper'

class MyimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myimage = myimages(:one)
  end

  test "should get index" do
    get myimages_url
    assert_response :success
  end

  test "should get new" do
    get new_myimage_url
    assert_response :success
  end

  test "should create myimage" do
    assert_difference('Myimage.count') do
      post myimages_url, params: { myimage: { description: @myimage.description, img: @myimage.img, title: @myimage.title } }
    end

    assert_redirected_to myimage_url(Myimage.last)
  end

  test "should show myimage" do
    get myimage_url(@myimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_myimage_url(@myimage)
    assert_response :success
  end

  test "should update myimage" do
    patch myimage_url(@myimage), params: { myimage: { description: @myimage.description, img: @myimage.img, title: @myimage.title } }
    assert_redirected_to myimage_url(@myimage)
  end

  test "should destroy myimage" do
    assert_difference('Myimage.count', -1) do
      delete myimage_url(@myimage)
    end

    assert_redirected_to myimages_url
  end
end
