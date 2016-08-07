# == Schema Information
#
# Table name: bookings
#
#  id                  :integer          not null, primary key
#  booker_id           :integer
#  bookee_id           :integer
#  price               :integer
#  currency            :string
#  bookee_confirmed_at :datetime
#  booker_confirmed_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  bookee_type         :string
#  event_id            :integer
#

class Booking < ApplicationRecord
  belongs_to :booker, :class_name => 'User'
  belongs_to :bookee, :polymorphic => true
  belongs_to :event
  
  validates :booker, :presence => true
  validates :bookee, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 50} # minimum JPY required by stripe
  
  accepts_nested_attributes_for :event
  
  after_create do
    ApplicationMailer.booking_inquiry(self).deliver_later
    Message.create(:topicable => self, :text => 'Booking request has been received.')
  end
end
