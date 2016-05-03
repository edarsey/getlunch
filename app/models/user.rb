require 'street_address'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validate :correct_address

  has_many :lunchtimes
  has_many :invites
  has_many :lunchtimes, through: :invites

  def correct_address
    address_to_check = StreetAddress::US.parse(self.address)
    if address_to_check.nil?
      errors.add(:address, "must be completed")
    elsif address_to_check.postal_code.nil?
      errors.add(:address, "zip code must be put in correctly")
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end
