# == Schema Information
#
# Table name: bookings
#
#  id                  :integer          not null, primary key
#  booker_id           :integer
#  bookee_id           :integer
#  price               :integer
#  currency            :string
#  bookee_confirmed_at :datetime
#  booker_confirmed_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  bookee_type         :string
#  event_id            :integer
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
