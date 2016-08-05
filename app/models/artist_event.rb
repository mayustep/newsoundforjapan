# == Schema Information
#
# Table name: artist_events
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtistEvent < ApplicationRecord
  belongs_to :artist
  belongs_to :event
  
  validates :artist, :uniqueness => {:scope => :event}
end
