class CreateLunchtimes < ActiveRecord::Migration
  def change
    create_table :lunchtimes do |t|
      t.string :restaurant
      t.string :address, null: false
      t.datetime :eattime, null: false
      t.belongs_to :user, null: false
    end
  end
end
