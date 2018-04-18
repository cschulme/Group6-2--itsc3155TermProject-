class CalendarViewController < ApplicationController
    require 'date'
    @dateInUse = Date.today
    
    def index
       
    end
    
    def previousMonth
       @dateInUse.prev_month(1) 
    end
    
    def nextMonth
        @dateInUse.next_month(1)
    end
end
