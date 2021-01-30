class Classroom < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  
  def to_s
    name
  end

end
