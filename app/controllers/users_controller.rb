class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show]
	before_action :correct_user, only: [:show]

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
		@upcoming_events = current_user_upcoming_events
		@past_events = current_user_past_events
	end

	private
	  def user_params
    	params.require(:user).permit(:username, :email)
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
