class TextsController <ApplicationController
	# https://www.twilio.com/blog/2012/02/adding-twilio-sms-messaging-to-your-rails-app.html
	def index
		# let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file
    
    message_body = params["Body"]
    from_number = params["From"]

    SMSLogger.log_text_message from_number, message_body
	end

	def new
	end

	def create
		number_to_send_to = params[:phone]

		account_sid = "AC8ca0e36158a0c1795cb1207c5dace357"
		auth_token = "7f7c60129aa2503c14e14a2681226705"
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

