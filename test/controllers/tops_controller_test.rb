require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get tops_about_url
    assert_response :success
  end

  test "should get caution" do
    get tops_caution_url
    assert_response :success
  end

  test "should get term" do
    get tops_term_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get tops_privacy_policy_url
    assert_response :success
  end

end
