require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get nothing" do
    get homes_nothing_url
    assert_response :success
  end

  test "should get question" do
    get homes_question_url
    assert_response :success
  end

  test "should get chat" do
    get homes_chat_url
    assert_response :success
  end

  test "should get pay" do
    get homes_pay_url
    assert_response :success
  end

  test "should get sell" do
    get homes_sell_url
    assert_response :success
  end

  test "should get buy" do
    get homes_buy_url
    assert_response :success
  end

end
