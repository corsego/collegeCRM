class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page, :privacy_policy]

  def landing_page
  end

  def privacy_policy
  end
  
  def calendar
    if params.has_key?(:user_id)
      lessons = Lesson.includes(:user, :classroom, :course, :attendances)
      if params[:user_id].present?
        lessons = lessons.where(user_id: params[:user_id])
      end
      if params[:classroom_id].present?
        lessons = lessons.where(classroom_id: params[:classroom_id])
      end
      if params[:course_id].present?
        lessons = lessons.where(course_id: params[:course_id])
      end
      @lessons = lessons.all
    else
      @lessons = Lesson.includes(:user, :classroom, :course, :attendances)
    end
  end
end
