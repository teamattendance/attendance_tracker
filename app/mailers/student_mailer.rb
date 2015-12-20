class StudentMailer < ApplicationMailer
	default from: "testingemailusability@gmail.com"

	def welcome_email(user, cohort, password)
		@user = user
		@cohort = cohort
		@password = password
		@url = 'http://www.google.com'
		mail(to: @user.email, subject: 'Welcome to ' + @cohort.cohort_name)
	end
end
