require 'test_helper'

class Admins::GamegenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_gamegenres_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_gamegenres_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_gamegenres_destroy_url
    assert_response :success
  end

end
