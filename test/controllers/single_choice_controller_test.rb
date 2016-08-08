require 'test_helper'

class SingleChoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get single_choice_index_url
    assert_response :success
  end

  test "should get show" do
    get single_choice_show_url
    assert_response :success
  end

  test "should get new" do
    get single_choice_new_url
    assert_response :success
  end

  test "should get create" do
    get single_choice_create_url
    assert_response :success
  end

  test "should get edit" do
    get single_choice_edit_url
    assert_response :success
  end

  test "should get update" do
    get single_choice_update_url
    assert_response :success
  end

  test "should get destroy" do
    get single_choice_destroy_url
    assert_response :success
  end

end
