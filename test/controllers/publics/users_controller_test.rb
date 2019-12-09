require 'test_helper'

class Publics::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_users_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_users_show_url
    assert_response :success
  end

  test "should get matching" do
    get publics_users_matching_url
    assert_response :success
  end

  test "should get info" do
    get publics_users_info_url
    assert_response :success
  end

  test "should get edit" do
    get publics_users_edit_url
    assert_response :success
  end

  test "should get edi2" do
    get publics_users_edi2_url
    assert_response :success
  end

  test "should get update" do
    get publics_users_update_url
    assert_response :success
  end

  test "should get update2" do
    get publics_users_update2_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_users_destroy_url
    assert_response :success
  end

  test "should get block" do
    get publics_users_block_url
    assert_response :success
  end

end
