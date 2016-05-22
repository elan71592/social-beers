class SessionController < ApplicationController
  include ApplicationHelper
  def login
    if logged_in?
      redirect_to '/'
    else
      if request.xhr?
        render template: '/session/login', layout: false
      end
    end
  end

  def new
    render template: '/session/new', layout: false
  end

  def try_login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if request.xhr?
        render template: '/session/_logged_in_corner', layout: false, locals: { user: @user }
      else
        redirect_to '/'
      end
    else
      @error = "Email or password was incorrect. Please try again!"
      render template: '/session/login', layout: false
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
end
