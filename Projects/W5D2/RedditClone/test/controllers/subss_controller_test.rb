require 'test_helper'

class SubssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subss_index_url
    assert_response :success
  end

  test "should get show" do
    get subss_show_url
    assert_response :success
  end

  test "should get new" do
    get subss_new_url
    assert_response :success
  end

  test "should get create" do
    get subss_create_url
    assert_response :success
  end

  test "should get edit" do
    get subss_edit_url
    assert_response :success
  end

  test "should get update" do
    get subss_update_url
    assert_response :success
  end

  test "should get destroy" do
    get subss_destroy_url
    assert_response :success
  end

  test "should get sub_params" do
    get subss_sub_params_url
    assert_response :success
  end

end
