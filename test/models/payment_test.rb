# == Schema Information
#
# Table name: payments
#
#  id             :integer          not null, primary key
#  fund_id        :integer
#  user_id        :integer
#  amount         :integer
#  currency       :string
#  confirmed      :boolean
#  public         :boolean
#  transaction_id :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  refunded_at    :datetime
#  image_name     :string
#  image_uid      :string
#  url            :string
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
