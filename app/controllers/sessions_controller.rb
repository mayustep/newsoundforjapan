# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SessionsController < ApplicationController
  

  # GET /sessions
  # GET /sessions.json
  # def index
  #   @sessions = Session.all
  # end

  # GET /sessions/1
  # GET /sessions/1.json
  # def show
  # end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  # def edit
  # end

  # POST /sessions
  # POST /sessions.json
  def create
    if request.env['omniauth.auth']
      @session = Session.new(:auth_hash => request.env['omniauth.auth'])
    else
      @session = Session.new(session_params)
    end
    
    respond_to do |format|
      if @session.save
        session[:user_id] = @session.user_id
        format.html { redirect_to root_url, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  # def update
  #   respond_to do |format|
  #     if @session.update(session_params)
  #       format.html { redirect_to @session, notice: 'Session was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @session }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @session.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def link_calendar
    client = Signet::OAuth2::Client.new({
      client_id: ENV.fetch('GOOGLE_API_CLIENT_ID'),
      client_secret: ENV.fetch('GOOGLE_API_CLIENT_SECRET'),
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      redirect_uri: link_calendar_session_url,
      code: params[:code]
    })

    response = client.fetch_access_token!
    
    artist = Artist.find(params[:state])
    # TODO: check if user has management rights
    artist.google_calendar_token = response['access_token']
    artist.google_calendar_refresh_token = response['refresh_token']
    artist.save
    
    redirect_to artist, notice: 'Calendar has been linked to Artist.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:email, :password)
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
end
