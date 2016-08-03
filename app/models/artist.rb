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
end
