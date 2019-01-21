require 'test_helper'
require 'generators/product_spec/product_spec_generator'

class ProductSpecGeneratorTest < Rails::Generators::TestCase
  tests ProductSpecGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
