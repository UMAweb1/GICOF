require 'test_helper'

class Publics::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_posts_index_url
    assert_response :success
  end

  test "should get create" do
    get publics_posts_create_url
    assert_response :success
  end

  test "should get show" do
    get publics_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get publics_posts_new_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_posts_destroy_url
    assert_response :success
  end

end
