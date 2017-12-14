class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # display text & links
  end

  def login
    # login form
    render :layout => false
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Ha ingresado correctamente."
      redirect_to(access_menu_path)
    else
      flash.now[:notice] = "El Usuario o Clave son invalidos."
      redirect_to(access_login_path)
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Ha cerrado sesión correctamente."
    redirect_to(access_login_path)
  end


  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Iniciar sesión primero."
      redirect_to(access_login_path)
      # redirect_to prevents the requested action from running
    end
  end

end
