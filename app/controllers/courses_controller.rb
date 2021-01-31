class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :generate_lessons]

  def index
    @courses = Course.all
  end

  def generate_lessons
    # delete future lessons to regenerate them
    @course.lessons.where("start > ?", Time.now).destroy_all

    # regenerates future lessons

    # @course.schedule.occurrences(Time.now + 1.month).each do |occurrence|
    @course.schedule.next_occurrences(8).each do |occurrence|
      @course.lessons.find_or_create_by(start: occurrence, user: @course.user, classroom: @course.classroom)
    end
    redirect_to @course, notice: "generate_lessons - ok"
  end

  def show
    @lessons = @course.lessons
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:user_id, :classroom_id, :service_id, :start_time, 
        *Course::DAYS_OF_WEEK,
        enrollments_attributes: [:id, :user_id, :_destroy])
    end
end
