class TextsController <ApplicationController
	before_action :authorize
	# https://www.twilio.com/blog/2012/02/adding-twilio-sms-messaging-to-your-rails-app.html
	def index
		# let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file
    
    message_body = params["Body"]
    from_number = params["From"]

    SMSLogger.log_text_message from_number, message_body
	end

	def new
		@user = User.find(params[:student_id])
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

