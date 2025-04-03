class SessionsController < ApplicationController
  def new
    @users = User.new
  end

def create
  @users = User.find_by(email: params[:email])
  if @users&.authenticate(params[:password])
    sign_in(@users)
    redirect_to root_path
  else
    flash.now[:error] = 'Invalid email or password'
    render :new
  end
end


  def destroy
    sign_out
    redirect_to root_path, notice: 'Logout successful'
  end
end
