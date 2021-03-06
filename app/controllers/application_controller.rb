class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user
  before_action :set_locale
  around_action :set_tz

private
  def set_user
    @current_user = User.find(session[:user_id]) if session[:user_id] rescue nil
  end

  def atomic_posts
   if request.method == 'GET' || !current_user
     yield
   else
     ActiveRecord::Base.transaction do
       User.where(:id => @current_user).lock(true).first
       yield
     end
   end
 end

 def atomic
   ActiveRecord::Base.transaction do
     User.where(:id => @current_user).lock(true).first
     yield
   end
 end

 def set_locale
   if params[:locale]
     I18n.locale = cookies.permanent[:locale] = params[:locale]
     @current_user.update(:locale => params[:locale]) if @current_user
  #  elsif @current_user && @current_user.locale
  #    I18n.locale = @current_user.locale
   elsif cookies[:locale]
     I18n.locale = cookies[:locale]
   else
     lookup = GEOIP.lookup(request.ip)
     I18n.locale = cookies.permanent[:locale] = guess_locale_from_country_code(lookup.country.iso_code)
   end
 end

 def guess_locale_from_country_code code
   if code == 'JP'
     'ja'
   else
     'en'
   end
 end

 def set_tz
   if params[:tz]
     tz = cookies.permanent[:tz] = params[:tz]
     @current_user.update(:tz => params[:tz]) if @current_user
  #  elsif @current_user && @current_user.tz
  #    tz = @current_user.tz
   elsif cookies[:tz]
     tz = cookies[:tz]
   else
     lookup = GEOIP.lookup(request.ip)
     tz = guess_tz_from_country_code(lookup.country.iso_code)
   end
   Time.use_zone tz do
     yield
   end
 end

 def guess_tz_from_country_code code
   if code == 'JP'
     'Tokyo'
   else
     'UTC'
   end
 end

end
