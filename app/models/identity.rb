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

class Identity < ApplicationRecord
  scope :stripe, -> { where :provider => 'stripe_connect' }
  scope :facebook, -> { where :provider => 'facebook' }
  
  belongs_to :user
end
