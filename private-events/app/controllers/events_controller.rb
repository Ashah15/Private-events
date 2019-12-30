class EventsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]
    before_action :event_owner, only: [:destroy]


	def new
      @user = current_user
	  @event = Event.new
	end

    def create
        @event = current_user.events.build(events_params)
        @event.creator = current_user
        if @event.save
            flash.now[:success] = 'Event created!'
            redirect_to events_path
        else
            render 'events/new'
        end
    end

    def show
        @user = current_user
    	@event = Event.find(params[:id])
        @attendees = @event.attendees
        @isAttendee = @event.attendees.exists?(:name => current_user.username)
    end

    def index
    	@user = current_user
        @past_events = Event.past.paginate(page: params[:page],per_page: 3)
        @upcoming_events = Event.upcoming.paginate(page: params[:page],per_page: 3)
    end

    def destroy
    	@event = Event.find(params[:id])
    	@event.destroy
    	redirect_to events_path
    end

	private

    def events_params
    	params.require(:event).permit(:name, :venue, :time, :event_date, :description)
    end


    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def event_owner
      @event = Event.find(params[:id])
      unless current_user == @event.creator
        flash[:danger] = "You do not own this event"
        redirect_to events_path
      end
    end
end
