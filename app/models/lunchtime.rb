class Lunchtime < ActiveRecord::Base
  belongs_to :user
  has_many :invites
  has_many :users, through: :invites

  def realtime(time)
    time.strftime("%A %B %d, %G %I:%M %p")
  end

  def accepted_invites
    invites.where(accepted: true)
  end

  def open_invites
    invites.where(accepted: false, declined: false)
  end

  def declined_invites
    invites.where(declined: true)
  end

  delegate :name, to: :user, prefix: false
end
