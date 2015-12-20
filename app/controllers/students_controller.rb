# student GET   /students/:id(.:format) students#show
# cohort_students POST  /cohorts/:cohort_id/students(.:format)      students#create
# new_cohort_student GET   /cohorts/:cohort_id/students/new(.:format)   students#new

class StudentsController < ApplicationController
	before_action :authorize
	# /students/:id
	def show
		@user = User.find(session[:user_id])
		# @student = Student.find(session[:user_id])
		@student = Student.find(params[:id])
		cohort = Cohort.find(params[:cohort_id])
		@missed = 0
    @lates = 0
    @student.date_records.each do |record| 
    if record.day >= cohort.start_date && record.day <= cohort.end_date  
    	if record.attendence == "unexcused" 
       @missed = @missed+1 
     elsif record.attendence == "late"
       @lates = @lates+1 
     end
    end
  end
	end

	#/cohorts/:cohort_id/students/new
	def new
		@user = User.find(session[:user_id])
		if @current_user.type != "Instructor"
			redirect_to cohorts_path
		else
			@cohort = Cohort.find(params[:cohort_id])
			@student = Student.new
		end
	end

	#/cohorts/:cohort_id/students
	def create
		students = Student.all
		email_array = students.map {|student| student.email}
		if email_array.include? params['student'][:email]
			@student = Student.find_by(email: params['student'][:email])
		else
			@student = Student.create(student_params)
		end
		@cohort = Cohort.find(params[:cohort_id])
		@cohort.users.push(@student)
		redirect_to cohort_students_path
	end

 private

 def student_params
 	params.require(:student).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name)
 end

end #class
