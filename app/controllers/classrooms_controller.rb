class ClassroomsController < ApplicationController
  before_action :set_classroom, only: %i[show edit update destroy]

  def index
    @classrooms = Classroom.all
  end

  def show
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to @classroom, notice: 'Classroom was successfully created.'
    else
      render :new
    end
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to @classroom, notice: 'Classroom was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @classroom.destroy
      redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.'
    else
      redirect_to classrooms_url, alert: 'Classroom has courses. Can not be deleted.'
    end
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
