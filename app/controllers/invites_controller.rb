class InvitesController < ApplicationController
  before_action :before_answer

  def accept
    @answer.accepted = true
    @answer.declined = false
    @answer.save
    @lunchtime.accepted_invites.each do |invite|
      @iaccept << invite.name
    end
    @lunchtime.open_invites.each do |invite|
      @iinvite << invite.name
    end
    @lunchtime.declined_invites.each do |invite|
      @idecline << invite.name
    end

    render json: {
      invitesAccepted: @iaccept,
      invitesUnanswered: @iinvite,
      invitesDeclined: @idecline
    }
  end

  def decline
    @answer.accepted = false
    @answer.declined = true
    @answer.save
    @lunchtime.accepted_invites.each do |invite|
      @iaccept << invite.name
    end
    @lunchtime.open_invites.each do |invite|
      @iinvite << invite.name
    end
    @lunchtime.declined_invites.each do |invite|
      @idecline << invite.name
    end
    render json: {
      invitesAccepted: @iaccept,
      invitesUnanswered: @iinvite,
      invitesDeclined: @idecline
    }
  end

  def before_answer
    @lunchtime = Lunchtime.find(params[:lunchtime_id])
    @user = current_user
    @answer = Invite.find_by_user_id_and_lunchtime_id(@user.id, @lunchtime.id)
    @iaccept = []
    @iinvite = []
    @idecline = []
  end

  private

  def invite_params

  end
end
