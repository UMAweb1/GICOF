require 'test_helper'

class Publics::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_rooms_create_url
    assert_response :success
  end

  test "should get show" do
    get publics_rooms_show_url
    assert_response :success
  end

  test "should get index" do
    get publics_rooms_index_url
    assert_response :success
  end

end
