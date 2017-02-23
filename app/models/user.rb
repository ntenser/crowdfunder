class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  has_many :backed_projects, -> { order('title ASC').uniq }, through: :pledges, class_name: Project, source: :project
  has_many :pledges



  validates :password, length: { minimum: 4 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end
