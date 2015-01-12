require "test_helper"

class CountryTest < ActiveSupport::TestCase

  fixtures :countries, :connections
  # test "the truth" do
  #   assert true
  # end

  def test_neighbors
    country = Country.find_by(name: "Mexico")
    assert_equal "Mexico", country.name
    assert_equal 2, country.neighbors.count
  end

end
