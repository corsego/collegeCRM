class Classroom < ApplicationRecord
  has_many :courses, dependent: :restrict_with_error

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def to_s
    name
  end
end
