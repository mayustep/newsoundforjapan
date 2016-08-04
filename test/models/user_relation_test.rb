# == Schema Information
#
# Table name: user_relations
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  relative_id   :integer
#  relative_type :string
#  relation      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UserRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
