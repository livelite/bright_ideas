class UsersController < ApplicationController
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/ideas'
		else
			flash[:form_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
		end
end
