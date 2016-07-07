class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validate :due_date_cannot_be_in_the_past
  has_many :tasks
  has_many :discussions, dependent: :destroy

  def self.search(search)
  where("title ILIKE :word OR description ILIKE :word", {word: "%#{search}%"})
  end

  def due_date_cannot_be_in_the_past
    if self.due_date && self.due_date < Date.today
      errors.add(:due_date, "date cannot be in the past")
    end
  end

end
