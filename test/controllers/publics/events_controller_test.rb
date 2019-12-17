require 'test_helper'

class Publics::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_events_create_url
    assert_response :success
  end

  test "should get new" do
    get publics_events_new_url
    assert_response :success
  end

  test "should get index" do
    get publics_events_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get publics_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_events_destroy_url
    assert_response :success
  end

end
