Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], :image_size => 'large'
  provider :stripe_connect, ENV['STRIPE_CONNECT'], ENV['STRIPE_SECRET_KEY']
end
