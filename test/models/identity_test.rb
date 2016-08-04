# == Schema Information
#
# Table name: identities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  provider    :string
#  provider_id :string
#  token       :string
#  expires_at  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class IdentityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
