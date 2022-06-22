class EventsController < ApplicationController
  def index
    @events=Event.all
  end

  def new
    @event = Event.new

  if request.xhr?
    respond_to do |format|
        format.json {
            render json: {locations: Location.where("city_id = ?", params[:city_id])}
        }
    end
  end
  end

  def create
    @event= Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end  
  end
    
  private
  def event_params
    params.require(:event).permit(:category_id, :location_id, :name)
  end
end
