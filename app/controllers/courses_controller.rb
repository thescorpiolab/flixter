class CoursesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	
	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
	end
end
