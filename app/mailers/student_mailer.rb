class StudentMailer < ApplicationMailer
	default from: "testingattendence@gmail.com"

	def welcome_email(user, cohort, password)
		# @user = user
		# @cohort = cohort
		# @password = password
		# @url = 'https://www.google.com'
		# mail(to: @user.email, subject: 'Welcome to ' + @cohort.cohort_name)
		mail = SendGrid::Mail.new do |m|
			m.to = "#{@user.email}"
			m.from = "testingattendence@gmail.com"
			m.subject = "Welcome to #{@cohort.cohort_name}"
			m.text = "I heard you like pineapple"
		end
	end
end
