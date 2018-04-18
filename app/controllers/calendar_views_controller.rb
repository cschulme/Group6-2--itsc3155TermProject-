class CalendarViewsController < ApplicationController
    
    def index
        @dateInUse = CalendarView.find(1).dateInUse
        
        if @dateInUse.nil?
            CalendarView.create(:dateInUse => Date.today)
            @dateInUse = CalendarView.find(1).dateInUse
        end
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
        if CalendarView.find(1).dateInUse.nil?
            CalendarView.create(:dateInUse => Date.today)
        end
        
        if CalendarView.find(1).dateInUse != Date.today
            CalendarView.find(1).update(:dateInUse => Date.today)
        end
        
        redirect_to calendar_views_path
    end
end
