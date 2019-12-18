class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
    	redirect_to @user
		else
			 render 'new'
		end
	end

	def show
		@user = current_user
	end

	private
	  def user_params
    	params.require(:user).permit(:username, :email)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
