require 'test_helper'

class Admins::ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_product_index_url
    assert_response :success
  end

end
