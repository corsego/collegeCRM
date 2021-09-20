class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing_page privacy_policy]

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

      lessons = lessons.where(user_id: @user) if @user.present?
      lessons = lessons.where(classroom_id: @classroom) if @classroom.present?
      lessons = lessons.where(course_id: @course) if @course.present?
      @lessons = lessons.all
    else
      @lessons = Lesson.includes(:user, :classroom, :course, :attendances)
    end
  end
end
