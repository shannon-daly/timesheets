class TimesheetEntry < ApplicationRecord

  validates :date, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validate :date_cannot_be_in_the_future
  validate :finish_time_cannot_be_less_than_start_time
  validates :date, uniqueness: { scope: [:start_time, :finish_time] }

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end

  def finish_time_cannot_be_less_than_start_time
    if finish_time.present? && finish_time < start_time
      errors.add(:finish_time, "can't be less than start time")
    end
  end

  # def self.in_range?(r1,r2)
  #   !(r1.first > r2.last || r1.last < r2.first)
  # end

  # def self.intersect(r1,other)
  #   [r1.min, other.min].max..[r1.max, other.max].min
  # end
end