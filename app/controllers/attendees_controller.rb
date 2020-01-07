class AttendeesController < ApplicationController

	def create
		@attendee = Attendee.new(attendee_params)
		if @attendee.save
		  redirect_to event_path(@attendee.attended_event_id)
		end
	end

	private

  def attendee_params
  	params.permit(:name,:attendee_id, :attended_event_id)
  end

end
