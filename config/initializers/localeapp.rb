require 'localeapp/rails'
Localeapp.configure do |config|
  config.api_key = ENV['LOCALEAPP_KEY']
  config.reloading_environments = [:development, :production]
  config.polling_environments = [:production]
  config.poll_interval = 60
end

if Rails.env.production?
  Localeapp::CLI::Pull.new.execute
end
