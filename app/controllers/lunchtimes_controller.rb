class LunchtimesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @lunchtimes = Lunchtime.all
      @lunchtime = Lunchtime.new
    end
  end

  def create
    @lunchtime = Lunchtime.new(lunchtime_params)
    @lunchtime.user = current_user
    @invitees = User.all - [@lunchtime.user]
    if @lunchtime.save
      @invitees.each do |invitee|
        Invite.create(lunchtime: @lunchtime, user: invitee)
      end
      flash[:message] = "You have successfully created a new lunchtime."
      redirect_to root_path
    else
      flash[:error] = @lunchtime.errors.full_messages.join(", ")
      render :index
    end
  end

  def destroy
    @lunchtime = Lunchtime.find(params[:id])
    if @lunchtime.destroy!
      flash[:message] = "Post deleted!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong."
      redirect_to root_path
    end
  end

  private

  def lunchtime_params
    params.require(:lunchtime).permit(
      :restaurant,
      :eattime,
      :address
    )
  end
end
