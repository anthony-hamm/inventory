class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]


  def menu
    # display text & links
    #  render 'menu'
     render layout:false
  end

  def login
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
      flash[:notice] = "El Usuario o Clave son inválidos."
      redirect_to(access_login_path)
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Ha cerrado sesión correctamente."
    redirect_to(access_login_path)
  end

end
