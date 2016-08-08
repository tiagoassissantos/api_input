require 'test_helper'

class FileInputControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get file_input_search_url
    assert_response :success
  end

  test "should get greater_size" do
    get file_input_greater_size_url
    assert_response :success
  end

  test "should get greater_inbox" do
    get file_input_greater_inbox_url
    assert_response :success
  end

end
