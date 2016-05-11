# == Schema Information
#
# Table name: pages
#
#  id         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord
  include Translatable
  
  accepts_translations_for :name
  accepts_translations_for :body
end
