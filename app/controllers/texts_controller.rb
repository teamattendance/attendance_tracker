class TextsController <ApplicationController
	before_action :authorize
	skip_before_action :verify_authenticity_token, only: [:index]
	# https://www.twilio.com/blog/2012/02/adding-twilio-sms-messaging-to-your-rails-app.html
	def index
		# let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file
    
    message_body = params["Body"]
    from_number = params["From"]

    SMSLogger.log_text_message from_number, message_body
    @user = User.find_by(phone: from_number)
    puts @user
    # message_array = message_body.split(" ")
    # message_array.each do |mess|
    # 	if mess.start_with?("sick")
    # 		@user.date_records.where(day: Time.now.to_s.split(" ")[0].to_date).attendence = "excused"
    # 	elsif mess.start_with?("late")
    # 		@user.date_records.where(day: Time.now.to_s.split(" ")[0].to_date).attendence = "late"
    # 	end
    # end
    Cohort.first.cohort_name = "This Worked"
    redirect_to cohorts_path
	end

	def new
		@user = User.find(params[:student_id])
		@absences = Cohort.find(params[:cohort_id]).max_absences-1
	end

	def create
		account_sid = ENV['TWILIO_ACCT_SID']
		auth_token = ENV['TWILIO_AUTH_TOKEN']
		client = Twilio::REST::Client.new account_sid, auth_token

		from = "+14125153260"

	  client.account.sms.messages.create(
	    :from => "#{from}",
	    :to => params[:phone_num],
	    :body => params[:body]
	  )
	  redirect_to "/cohorts"
	end

end

