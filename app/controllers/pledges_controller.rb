class PledgesController < ApplicationController
  before_action :require_login
  load_and_authorize_resource

  def create

 # if @project.end_date < Datetime.now
  
  #  redirect_to root_path
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    @pledge.reward = Reward.find(params[:reward_id])

    if @pledge.save
      redirect_to project_url(@pledge.project), notice: "You have successfully backed #{@pledge.project.title}!"
    else
      @project = @pledge.project
      render 'projects/show'
    end
  end


  private

  def pledge_params
    params.require(:pledge).permit(:dollar_amount)
  end
end
