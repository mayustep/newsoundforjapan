# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  amount     :integer
#  currency   :string
#  name       :string
#  fund_id    :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_name :string
#  image_uid  :string
#

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
