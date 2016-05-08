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

class Goal < ApplicationRecord
  include Translatable
  acts_as_list :scope => :fund
  belongs_to :fund
  accepts_translations_for :description
  dragonfly_accessor :image
  
  def collected_amount
    amount_required_for_previous_goals = fund.goals.where(['position < ?', self.position]).sum(:amount)
    [0,[amount, fund.payments.paid.sum(:amount) - amount_required_for_previous_goals].min].max
  end
  
  def progress_percent
    percent = (100.0 * collected_amount / amount)
    if percent < 99
      percent.ceil 
    else 
      percent.floor
    end
  end

end
