# == Schema Information
#
# Table name: payments
#
#  id             :integer          not null, primary key
#  fund_id        :integer
#  user_id        :integer
#  amount         :integer
#  currency       :integer
#  confirmed      :boolean
#  public         :boolean
#  transaction_id :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :fund

  scope :paid, -> { where :confirmed => true, :refunded_at => nil }
  
  def formatted_number
    id.to_s.rjust(6, '0').insert(3,'-')
  end
end
