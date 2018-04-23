class CalendarViewsController < ApplicationController
    def index
        @dateInUse = CalendarView.find(1).dateInUse
        
        if @dateInUse.nil?
            CalendarView.create(:dateInUse => Date.today)
            @dateInUse = CalendarView.find(1).dateInUse
        end
    end
    
    def show
        @dateForShow = params[:day]
        @events = Event.where(:eventDate => @dateForShow)
        
    end
    
    def previousMonth
        @dateHolder = CalendarView.find(1).dateInUse - 1.month
        CalendarView.find(1).update(:dateInUse => @dateHolder)
        redirect_to calendar_views_path
    end
    
    def nextMonth
        @dateHolder = CalendarView.find(1).dateInUse + 1.month
        CalendarView.find(1).update(:dateInUse => @dateHolder)
        redirect_to calendar_views_path
    end
    
    def thisMonth
        if CalendarView.count == 0
            CalendarView.create(:dateInUse => Date.today)
        end
        
        if CalendarView.find(1).dateInUse != Date.today
            CalendarView.find(1).update(:dateInUse => Date.today)
        end
        
        redirect_to calendar_views_path
    end
    
    def selectMonth
        @calendar_view ||= nil
        @monthHolder = params[:monthParam]
        @yearHolder = params[:yearParam]
        @dateHolder = Date.parse('1-'+@monthHolder.to_s+'-'+@yearHolder.to_s)
        CalendarView.find(1).update(:dateInUse => @dateHolder)
        redirect_to calendar_views_path
    end
end
