require 'test_helper'

class NumberRangesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get number_ranges_new_url
    assert_response :success
  end

  test "should get create" do
    get number_ranges_create_url
    assert_response :success
  end

  test "should get edit" do
    get number_ranges_edit_url
    assert_response :success
  end

  test "should get update" do
    get number_ranges_update_url
    assert_response :success
  end

  test "should get show" do
    get number_ranges_show_url
    assert_response :success
  end

  test "should get index" do
    get number_ranges_index_url
    assert_response :success
  end

  test "should get destroy" do
    get number_ranges_destroy_url
    assert_response :success
  end

end
