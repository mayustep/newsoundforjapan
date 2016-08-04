# == Schema Information
#
# Table name: artists
#
#  id                            :integer          not null, primary key
#  name                          :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  image_uid                     :string
#  email                         :string
#  image_name                    :string
#  logo_uid                      :string
#  logo_name                     :string
#  representation_agreed_at      :datetime
#  google_calendar_token         :string
#  google_calendar_refresh_token :string
#  google_calendar_id            :string
#

class Artist < ApplicationRecord
  include Translatable

  has_many :user_relations, :as => 'relative'
  has_many :users, :through => :user_relations

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
  
  def user
    user_relations.is.first.try(:user)
  end
  
  def claim_by!(user)
    self.update(:representation_agreed => true)
    UserRelation.create(:relation => 'is', :user => user, :relative => self)
  end
  
  def managed_by?(user)
    UserRelation.where(:relation => 'is', :user => user).any?
  end
  
  def calendars
    @google_client ||= Signet::OAuth2::Client.new(
      client_id: ENV.fetch('GOOGLE_API_CLIENT_ID'),
      client_secret: ENV.fetch('GOOGLE_API_CLIENT_SECRET'),
      access_token: self.google_calendar_token,
      refresh_token: self.google_calendar_refresh_token,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    )
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = @google_client
    @calendar_list = service.list_calendar_lists
    @calendar_list
  end

end
