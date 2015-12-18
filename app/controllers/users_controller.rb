class UsersController <ApplicationController
	before_action :authorize
	#/users/:id
	def show
		@user=User.find(params[:id])
	end

	#/users/:id/edit
	def edit
		@user=User.find(session[:user_id])
	end

	#/users/:id
	def update
		@user=User.find(session[:user_id])
		@user.update(user_params)
		redirect_to user_url
	end

	private
		def user_params
			type_params = @user.type.downcase
			if type_params == 'student'
				params.require(:student).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name, :img_url, :bio)
			elsif type_params == 'producer'
				params.require(:producer).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name, :img_url, :bio)
			else
			params.require(:instructor).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name, :img_url, :bio)
			end
		end

end


