require 'test_helper'

class JustoysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @justoy = justoys(:one)
  end

  test "should get index" do
    get justoys_url
    assert_response :success
  end

  test "should get new" do
    get new_justoy_url
    assert_response :success
  end

  test "should create justoy" do
    assert_difference('Justoy.count') do
      post justoys_url, params: { justoy: { message: @justoy.message } }
    end

    assert_redirected_to justoy_url(Justoy.last)
  end

  test "should show justoy" do
    get justoy_url(@justoy)
    assert_response :success
  end

  test "should get edit" do
    get edit_justoy_url(@justoy)
    assert_response :success
  end

  test "should update justoy" do
    patch justoy_url(@justoy), params: { justoy: { message: @justoy.message } }
    assert_redirected_to justoy_url(@justoy)
  end

  test "should destroy justoy" do
    assert_difference('Justoy.count', -1) do
      delete justoy_url(@justoy)
    end

    assert_redirected_to justoys_url
  end
end
