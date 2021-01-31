class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page, :privacy_policy]

  def landing_page
  end

  def privacy_policy
  end
  
  def calendar
    @users = User.order(email: :asc)
    @classrooms = Classroom.order(name: :asc)
    @courses = Course.order(id: :desc)
    
    if params.has_key?(:user_id)
      lessons = Lesson.includes(:user, :classroom, :course, :attendances)
      @user = params[:user_id]
      @classroom = params[:classroom_id]
      @course = params[:course_id]

      if @user.present?
        lessons = lessons.where(user_id: @user)
      end
      if @classroom.present?
        lessons = lessons.where(classroom_id: @classroom)
      end
      if @course.present?
        lessons = lessons.where(course_id: @course)
      end
      @lessons = lessons.all
    else
      @lessons = Lesson.includes(:user, :classroom, :course, :attendances)
    end
  end
end
