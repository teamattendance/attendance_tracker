class UsersController <ApplicationController
	before_action :authorize
	#/users/:id
	def show
		@user=User.find(params[:id])
	end

	#/users/:id/edit
	def edit
		@user=User.find(session[:user_id])
		binding.pry
	end

	#/users/:id
	def update
		binding.pry
		@user=User.find(session[:user_id])
		@user.update(user_params)
		redirect_to user_url
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name, :img_url, :bio)
		end

end


