require 'test_helper'

class MultiChoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get multi_choice_new_url
    assert_response :success
  end

  test "should get create" do
    get multi_choice_create_url
    assert_response :success
  end

  test "should get edit" do
    get multi_choice_edit_url
    assert_response :success
  end

  test "should get update" do
    get multi_choice_update_url
    assert_response :success
  end

  test "should get show" do
    get multi_choice_show_url
    assert_response :success
  end

  test "should get destroy" do
    get multi_choice_destroy_url
    assert_response :success
  end

end
