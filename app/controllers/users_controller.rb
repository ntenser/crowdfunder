 class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       flash[:notice] = "Signed up!"
      auto_login(@user)
      redirect_to projects_url
    else
      flash.now[:error] = 'Sorry, try again!'
      render 'new'
    end
  end

  def show
    @projects = []
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end

    @owned = current_user.projects
    @pledges = Pledge.where(user_id: current_user)
    @projects = @user.backed_projects
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
