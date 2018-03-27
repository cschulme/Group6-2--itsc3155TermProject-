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
        @event = Event.new(event_params)
       
        if @event.save
            redirect_to @event
        else
            render 'new'
        end
    end
    
    def edit
        @note = Note.find(params[:id])
    end
    
    def update
        @note = Note.find(params[:id])
        
        if @note.update(note_params)
            redirect_to @note
        else
            render 'edit'
        end
    end
    
    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        
        redirect_to notes_path
    end
end

private
    def event_params
       params.require(:event).permit(:title, :location, :eventInformation, :eventDate, :startTime, :endTime, :tag) 
    end