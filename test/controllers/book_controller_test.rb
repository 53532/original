require 'test_helper'

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get book_update_url
    assert_response :success
  end

end
