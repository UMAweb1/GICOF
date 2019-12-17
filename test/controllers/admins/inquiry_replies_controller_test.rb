require 'test_helper'

class Admins::InquiryRepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_inquiry_replies_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_inquiry_replies_update_url
    assert_response :success
  end

end
