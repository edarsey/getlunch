class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunchtime

  delegate :name, to: :user, prefix: false
  # invite.name => "korben dallas"
end
