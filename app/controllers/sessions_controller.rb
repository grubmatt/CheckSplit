class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email].downcase.delete(' ')
    params[:email] = email
    user = Person.find_by_email(params[:email])
    if user && Person.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to person_path(current_user), notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end