require 'test_helper'

class BoxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boxes_index_url
    assert_response :success
  end

  test "should get show" do
    get boxes_show_url
    assert_response :success
  end

  test "should get new" do
    get boxes_new_url
    assert_response :success
  end

  test "should get home" do
    get boxes_home_url
    assert_response :success
  end

end
