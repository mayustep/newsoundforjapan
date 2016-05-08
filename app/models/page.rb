class Page < ApplicationRecord
  include Translatable
  
  accepts_translations_for :name
  accepts_translations_for :body
end
