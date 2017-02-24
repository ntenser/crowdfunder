class Project < ActiveRecord::Base

  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  belongs_to :user

  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date
  validate :expiration_date_cannot_be_in_the_past
  validate :end_date_is_after_start_date
  validates :goal, :numericality => { :greater_than_or_equal_to => 0 }


    def expiration_date_cannot_be_in_the_past
      if end_date.present? && end_date < Date.today
        errors.add(:end_date, "can't be in the past")
      end
    end

    def end_date_is_after_start_date
  return if end_date.blank? || start_date.blank?


  if end_date < start_date
    errors.add(:end_date, "cannot be before the start date")
  end
end




end
