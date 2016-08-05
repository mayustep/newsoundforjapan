# == Schema Information
#
# Table name: artist_events
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArtistEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
