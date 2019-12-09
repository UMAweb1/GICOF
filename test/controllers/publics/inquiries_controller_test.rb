require 'test_helper'

class Publics::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_inquiries_create_url
    assert_response :success
  end

  test "should get new" do
    get publics_inquiries_new_url
    assert_response :success
  end

end
