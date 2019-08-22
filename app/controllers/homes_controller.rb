class HomesController < ApplicationController
  def index
    @events = Event.where('starts_at  > ?', DateTime.now).order(:starts_at)
  end
end
