class Service < ApplicationRecord
  has_many :courses, dependent: :restrict_with_error

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :duration, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 180 }
  validates :student_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10_000 }
  validates :teacher_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10_000 }

  monetize :student_price, as: :student_price_cents
  monetize :teacher_price, as: :teacher_price_cents

  def to_s
    name
  end
end
