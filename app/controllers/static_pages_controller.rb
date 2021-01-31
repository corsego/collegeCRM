class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page, :privacy_policy]

  def landing_page
  end

  def privacy_policy
  end
  
  def calendar
    @lessons = Lesson.all
  end
end
