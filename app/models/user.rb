class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  has_many :pledges



  validates :password, length: { minimum: 4 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end
