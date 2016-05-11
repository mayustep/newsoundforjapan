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

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :fund

  scope :paid, -> { where :confirmed => true, :refunded_at => nil }
  scope :published, -> { where :public => true }
  
  dragonfly_accessor :image
  
  def formatted_number
    id.to_s.rjust(6, '0').insert(3,'-')
  end
  
  def more_than_average
    # add a 3 minute buffer
    amount > (fund.payments.where(:confirmed => true).where(['created_at < ?', self.created_at - 3.minutes]).average(:amount) || 0)
  end
  
  
  def to_param
    transaction_id
  end
  
end
