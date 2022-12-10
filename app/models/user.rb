# frozen_string_literal: true

class User < ApplicationRecord
  # :timeoutable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :lockable, :invitable,
         :omniauthable

  include Roleable

  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first
  #   user ||= User.create(
  #     email: data['email'],
  #     password: Devise.friendly_token[0, 20]
  #   )
  #   user.provider = access_token.provider
  #   user.uid = access_token.uid
  #   user.name = access_token.info.name if user.name.blank?
  #   user.image = access_token.info.image
  #   user.save
  #
  #   user.confirmed_at = Time.zone.now # autoconfirm user from omniauth
  #   user
  # end

  after_create do
    # assign default role
    update(student: true)
  end

  # as teacher
  has_many :courses, dependent: :restrict_with_error
  has_many :lessons, dependent: :restrict_with_error
  # as student
  has_many :enrollments, dependent: :restrict_with_error
  has_many :attendances, dependent: :restrict_with_error

  after_touch do
    calculate_student_total
    calculate_teacher_total
    calculate_balance
  end

  monetize :student_total, as: :student_total_cents
  monetize :teacher_total, as: :teacher_total_cents
  monetize :balance, as: :balance_cents

  def to_s
    email
  end

  def to_label
    to_s
  end

  def teacher?
    self.roles.map{|k, v| true if k == "teacher" && v }.any?
  end

  private

  def calculate_balance
    update_column :balance, (teacher_total - student_total)
  end

  def calculate_student_total
    update_column :student_total, attendances.map(&:student_price_final).sum
  end

  def calculate_teacher_total
    update_column :teacher_total, lessons.map(&:teacher_price_final).sum
  end
end
