require 'localeapp/rails'
Localeapp.configure do |config|
  config.api_key = ENV['LOCALEAPP_KEY']
  config.reloading_environments = [:development, :production, :staging]
  config.polling_environments = []
end
