require 'test_helper'

class Publics::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_relationships_create_url
    assert_response :success
  end

  test "should get block" do
    get publics_relationships_block_url
    assert_response :success
  end

end
