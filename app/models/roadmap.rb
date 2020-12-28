class Roadmap < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  validates_presence_of :the_one_thing,
                        :the_why_of_one_thing,
                        :the_one_habit,
                        :start_date
  validate :roadmap_must_start_in_future
  has_many :milestones
  accepts_nested_attributes_for :milestones

  def roadmap_must_start_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, 'can\'t be in the past')
    end
  end
end
