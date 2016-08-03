# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord
  include Translatable

  accepts_translations_for :bio
  dragonfly_accessor :image

  def representation_agreed=(value)
    if value
      self.representation_agreed_at = Time.now
    else
      # representation_agreed = nil # Can't undo an agreement
    end
  end
  
  def representation_agreed
    !representation_agreed_at.nil?
  end
  
  def calendars
    @google_client ||= Signet::OAuth2::Client.new(access_token: self.google_calendar_token, refresh_token: self.google_calendar_refresh_token)
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = @google_client
    @calendar_list = service.list_calendar_lists
    @calendar_list
  end
end
