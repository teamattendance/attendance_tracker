# student GET   /students/:id(.:format) students#show
# cohort_students POST  /cohorts/:cohort_id/students(.:format)      students#create
# new_cohort_student GET   /cohorts/:cohort_id/students/new(.:format)   students#new

class StudentsController < ApplicationController
	before_action :authorize
	# /students/:id
	def show
		# @student = Student.find(session[:user_id])
		@student = Student.find(params[:id])
		binding.pry
	end

	#/cohorts/:cohort_id/students/new
	def new
		@cohort = Cohort.find(params[:cohort_id])
		@student = Student.new
	end

	#/cohorts/:cohort_id/students
	def create
		@student = Student.create(student_params)
		@cohort = Cohort.find(params [:id])
		@cohort.users.push(@student)
		redirect_to cohort_students_path
	end

 private

 def student_params
 	params.require(:student).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name)
 end

end #class
