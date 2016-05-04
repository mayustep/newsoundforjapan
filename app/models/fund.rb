class Fund < ApplicationRecord
  include Translatable

  belongs_to :user
  has_many :payments
  has_many :goals

  accepts_translations_for :description

  first_user = User.where(:email => 'hello@newsoundforjapan.com').first_or_create(:password => 'ilovemusic', :password_confirmation => 'ilovemusic')
  Fund.where(:id => 1).first_or_create(:name => 'The Sound Check', :user_id => first_user.id)
end
