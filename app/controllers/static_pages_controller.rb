class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page, :privacy_policy]

  def landing_page
  end

  def privacy_policy
  end
  
  def calendar
    if params[:user_id].present?
      @lessons = Lesson.includes(:user, :classroom, :course, :attendances).where(user_id: params[:user_id])
    else
      @lessons = Lesson.includes(:user, :classroom, :course, :attendances)
    end
  end
end
