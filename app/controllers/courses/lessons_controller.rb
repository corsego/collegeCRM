class Courses::LessonsController < ApplicationController
  before_action :set_course
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

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

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:user_id, :classroom_id, :course_id, :status, :start,
        attendances_attributes: [:id, :user_id, :status, :_destroy])
    end
end
