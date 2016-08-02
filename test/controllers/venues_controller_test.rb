# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get venues_url
    assert_response :success
  end

  test "should get new" do
    get new_venue_url
    assert_response :success
  end

  test "should create venue" do
    assert_difference('Venue.count') do
      post venues_url, params: { venue: { name: @venue.name } }
    end

    assert_redirected_to venue_path(Venue.last)
  end

  test "should show venue" do
    get venue_url(@venue)
    assert_response :success
  end

  test "should get edit" do
    get edit_venue_url(@venue)
    assert_response :success
  end

  test "should update venue" do
    patch venue_url(@venue), params: { venue: { name: @venue.name } }
    assert_redirected_to venue_path(@venue)
  end

  test "should destroy venue" do
    assert_difference('Venue.count', -1) do
      delete venue_url(@venue)
    end

    assert_redirected_to venues_path
  end
end
