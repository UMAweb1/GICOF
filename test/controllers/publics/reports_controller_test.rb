require 'test_helper'

class Publics::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_reports_create_url
    assert_response :success
  end

  test "should get new" do
    get publics_reports_new_url
    assert_response :success
  end

end
