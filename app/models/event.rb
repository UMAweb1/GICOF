class Event < ApplicationRecord
  belongs_to :user

  validates :start, presence: true
  validates :end, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validate :start_end_time
  def start_end_time
    unless self.start.blank? || self.end.blank?
      errors.add(:end, 'を開始時刻以降にしてください') if self.start == self.end || self.start > self.end
    end
  end
end
