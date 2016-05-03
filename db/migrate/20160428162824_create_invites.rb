class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :lunchtime, null: false
      t.belongs_to :user, null: false
      t.boolean :accepted, default: false
      t.boolean :declined, default: false
    end
  end
end
