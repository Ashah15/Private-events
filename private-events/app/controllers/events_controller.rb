class EventsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :destroy]


	def new
	  @event = Event.new
	end

    def create
    	  @user = current_user
        @event = current_user.events.build(events_params)
        logger.debug
        if @event.save
        	logger.debug
        	  flash.now[:success] = 'Event created!'
            redirect_to events_path
        else
        	logger.debug
            render 'events/new'
        end
    end

    def show
    	@event = Event.find(params[:id])
    end

    def index
    	@user = current_user
        @events = Event.paginate(page: params[:page],per_page: 3)
    end

    def destroy
    	@event = Event.find(params[:id])
    	@event.destroy
    	redirect_to events_path
    end

	private

    def events_params
    	params.require(:event).permit(:name, :venue, :time, :event_date)
    end


    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
