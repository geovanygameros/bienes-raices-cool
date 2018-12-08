require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @property = properties(:one)
  end

  test "properties index path works" do
    get properties_path
    assert_response :success
  end

  test "load properties path works" do
    get '/load_properties', params:{properties_loaded:0, search_object: {rooms: 0, min_price:2000, max_price:50000}}
    assert_response :success
  end

  test "Properties show path works" do
    get property_path(@property)
    assert_response :success
  end



end
