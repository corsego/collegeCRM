# frozen_string_literal: true

module Courses
  class LessonsController < ApplicationController
    before_action :set_course
    before_action :set_lesson, only: %i[edit update destroy]
    before_action :require_teacher, only: %i[new create update]
    before_action :require_owner_or_admin, only: %i[destroy]

    def new
      @lesson = Lesson.new(classroom_id: @course.classroom_id, user_id: @course.user_id)
      @lesson.attendances.build(@course.enrollments.as_json(only: [:user_id]))
    end

    def edit
    end

    def create
      @lesson = Lesson.new(lesson_params)
      @lesson.course = @course

      if @lesson.save
        redirect_to @course, notice: 'Lesson was successfully created.'
      else
        render :new
      end
    end

    def update
      if @lesson.update(lesson_params)
        redirect_to @course, notice: 'Lesson was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @lesson.destroy
      redirect_to @course, notice: 'Lesson was successfully destroyed.'
    end

    private

    def require_teacher
      redirect_to (request.referer || root_path), alert: 'You are not authorized to perform this action' unless current_user.teacher? || current_user.admin?
    end

    def require_owner_or_admin
      redirect_to (request.referer || root_path), alert: 'You are not authorized to perform this action' unless current_user == @lesson.user || current_user.admin?
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:user_id, :classroom_id, :course_id, :status, :start,
                                     attendances_attributes: %i[id user_id status _destroy])
    end
  end
end
