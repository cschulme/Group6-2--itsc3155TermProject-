class EventsController < ApplicationController
    def index
        @events = Event.all 
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    def new
        @event = Event.new
    end
    
    def create
        @tag = Tag.find(params[:event][:tag_id])
        @event = @tag.events.create(event_params)
       
        if @event.save
            redirect_to @event
        else
            render 'new'
        end
    end
    
    def edit
        @event = Event.find(params[:id])
    end
    
    def update
        @event = Event.find(params[:id])
        
        if @event.update(event_params)
            redirect_to @event
        else
            render 'edit'
        end
    end
    
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        
        redirect_to events_path
    end
end

private
    def event_params
       params.require(:event).permit(:title, :location, :eventInformation, :eventDate, :startTime, :endTime)
    end