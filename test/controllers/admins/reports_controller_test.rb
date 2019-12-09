require 'test_helper'

class Admins::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_reports_index_url
    assert_response :success
  end

end
