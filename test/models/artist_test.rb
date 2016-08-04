# == Schema Information
#
# Table name: artists
#
#  id                            :integer          not null, primary key
#  name                          :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  image_uid                     :string
#  email                         :string
#  image_name                    :string
#  logo_uid                      :string
#  logo_name                     :string
#  representation_agreed_at      :datetime
#  google_calendar_token         :string
#  google_calendar_refresh_token :string
#  google_calendar_id            :string
#

require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
