require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
 test "creates a property without Easy Broker id" do
   assert_not Property.new(title: "Casa en Las Vegas").save
 end

 test "creates a property with Easy Broker id" do
   assert Property.new(title: "Casa en Las Vegas", easy_broker_id:"es-457").save
 end
end
