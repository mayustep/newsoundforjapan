# == Schema Information
#
# Table name: funds
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fund < ApplicationRecord
  include Translatable

  belongs_to :user
  has_many :payments
  has_many :goals

  accepts_translations_for :description
  accepts_nested_attributes_for :goals

  first_user = User.where(:email => 'hello@newsoundforjapan.com').first_or_create(:password => 'ilovemusic', :password_confirmation => 'ilovemusic')
  Fund.where(:id => 1).first_or_create(:name => 'The Sound Check', :user_id => first_user.id)
end
