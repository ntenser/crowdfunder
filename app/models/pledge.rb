class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :reward
  # has_one :project, through: :reward
  belongs_to :project

  validate :enough_pledged
  validates_presence_of :dollar_amount


  def enough_pledged
    unless self.dollar_amount >= reward.dollar_amount
      self.errors.add(:dollar_amount, "Amount pledged must be at least $#{reward.dollar_amount}")
    end
  end
end
