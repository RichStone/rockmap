class Roadmap < ApplicationRecord
  belongs_to :user
  has_many :milestones, dependent: :delete_all
  has_many :accountability_buddies, dependent: :delete_all

  accepts_nested_attributes_for :milestones
  accepts_nested_attributes_for :accountability_buddies

  validates_uniqueness_of :user_id
  validates_presence_of :the_one_thing,
                        :the_why_of_one_thing,
                        :the_one_habit,
                        :start_date
  validate :roadmap_must_start_in_future

  private

  def roadmap_must_start_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, 'can\'t be in the past')
    end
  end
end
