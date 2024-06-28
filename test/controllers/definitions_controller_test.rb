require "test_helper"

class DefinitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get definitions_index_url
    assert_response :success
  end

  test "should get create" do
    get definitions_create_url
    assert_response :success
  end

  test "should get update" do
    get definitions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get definitions_destroy_url
    assert_response :success
  end
end
