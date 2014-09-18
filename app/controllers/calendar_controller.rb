class CalendarController < ApplicationController
  require 'icalendar'

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def openings
    @cal = Icalendar.all
  end
end
