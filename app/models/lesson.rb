class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :course
end
