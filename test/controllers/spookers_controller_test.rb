require 'test_helper'

class SpookersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spooker = spookers(:one)
  end

  test "should get index" do
    get spookers_url
    assert_response :success
  end

  test "should get new" do
    get new_spooker_url
    assert_response :success
  end

  test "should create spooker" do
    assert_difference('Spooker.count') do
      post spookers_url, params: { spooker: { name: @spooker.name, picture: @spooker.picture } }
    end

    assert_redirected_to spooker_url(Spooker.last)
  end

  test "should show spooker" do
    get spooker_url(@spooker)
    assert_response :success
  end

  test "should get edit" do
    get edit_spooker_url(@spooker)
    assert_response :success
  end

  test "should update spooker" do
    patch spooker_url(@spooker), params: { spooker: { name: @spooker.name, picture: @spooker.picture } }
    assert_redirected_to spooker_url(@spooker)
  end

  test "should destroy spooker" do
    assert_difference('Spooker.count', -1) do
      delete spooker_url(@spooker)
    end

    assert_redirected_to spookers_url
  end
end
