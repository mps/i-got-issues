class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception

  before_filter :authenticate_user!

  helper_method :logged_in?
  helper_method :current_user
  helper_method :current_service

  protected
  def current_user
    @current_user ||= begin
      if session.has_key?(:user_id)
        user = User.find(session[:user_id])
        user.github_client = Octokit::Client.new(:access_token => session[:oauth_token])
        user
      end
    end
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  def current_service
    if session.has_key?(:service_id)
      @current_service ||= Service.where(user_id: session[:user_id], id: session[:service_id]).first
    end
  rescue ActiveRecord::RecordNotFound
    session[:service_id] = nil
  end

  def current_user?
    !!current_user
  end

  def logged_in?
    current_user?
  end

  def authenticate_user!
    if session.has_key?(:user_id)
      current_user
    else
      redirect_to root_url
    end
  end

  def logout!
    @current_user = nil
    reset_session
  end

  def set_team_members
    team_members = current_user.github_client.team_members @team.id
    @team_members = team_members.map {|member| member["login"] }
  end
end
