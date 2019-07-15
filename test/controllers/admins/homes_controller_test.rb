require 'test_helper'

class Admins::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_homes_new_url
    assert_response :success
  end

end
