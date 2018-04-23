class WelcomeController < ApplicationController
  def index
    @events = Event.where(:eventDate => Date.today)
  end
end
