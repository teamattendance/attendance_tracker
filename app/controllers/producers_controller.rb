class ProducersController < UsersController

	private
		def user_params
			type_params = @user.type.downcase
			params.require(:producer).permit(:email, :password, :password_confirmation, :phone, :first_name, :last_name, :img_url, :bio)
		end
end
