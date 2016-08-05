# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start_at   :datetime
#

class Event < ApplicationRecord
  
  has_many :artist_events
  has_many :artists, :through => :artist_events
  
  validate :start_at_cant_be_changed_into_past
  
  def start_at_cant_be_changed_into_past
    errors.add(:start_at, "can't be in the past") if start_at < Time.now && start_at_changed?
  end
  
  scope :upcoming, -> { where('start_at > ?', Time.now) }
end
