class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.includes(:user, :course, :classroom)
  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to @lesson, notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_url, notice: 'Lesson was successfully destroyed.'
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:user_id, :classroom_id, :course_id, :status, :start,
        attendances_attributes: [:id, :user_id, :status, :_destroy])
    end
end
