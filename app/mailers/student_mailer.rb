class StudentMailer < ApplicationMailer
	default from: "testingattendence@gmail.com"

	def welcome_email(user, cohort, password)
		@user = user
		@cohort = cohort
		@password = password
    binding.pry
		@url = 'https://www.google.com'
		mail(to: @user.email, subject: 'Welcome to ' + @cohort.cohort_name)
	end
end
