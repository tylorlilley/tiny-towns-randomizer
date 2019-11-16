require 'test_helper'

class TinyTownsRandomizerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tiny_towns_randomizer_new_url
    assert_response :success
  end

  test "should get create" do
    get tiny_towns_randomizer_create_url
    assert_response :success
  end

  test "should get show" do
    get tiny_towns_randomizer_show_url
    assert_response :success
  end

  test "should get index" do
    get tiny_towns_randomizer_index_url
    assert_response :success
  end

end
