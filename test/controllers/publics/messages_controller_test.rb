require 'test_helper'

class Publics::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_messages_create_url
    assert_response :success
  end

end
