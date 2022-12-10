# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  before_action :require_teacher, only: %i[new edit create update generate_lessons]
  before_action :require_admin, only: %i[destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @service.destroy
      redirect_to services_url, notice: 'Service was successfully destroyed.'
    else
      redirect_to services_url, alert: 'Service has courses. Can not be destroyed.'
    end
  end

  private

  def require_teacher
    redirect_to (request.referer || root_path), alert: 'You are not authorized to perform this action' unless current_user.teacher?
  end

  def require_admin
    redirect_to (request.referer || root_path), alert: 'You are not authorized to perform this action' unless current_user.admin?
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :duration, :student_price, :student_price_cents,
                                    :teacher_price, :teacher_price_cents)
  end
end
