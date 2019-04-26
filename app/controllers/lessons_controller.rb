class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_lesson, only: :show

	def show
	end

	private

	def require_authorized_for_current_lesson
    if !current_user.enrollments.pluck(:course_id).include?(current_lesson.section.course.id)
      redirect_to course_path, alert: "You must be enrolled to view lessons"
    end
  end

	def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
