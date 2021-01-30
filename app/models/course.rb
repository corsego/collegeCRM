class Course < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :service

  include Schedulable
end
