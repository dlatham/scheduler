class OpeningsController < ApplicationController
  http_basic_authenticate_with :name => "theo@refinedk9.com", :password => "Gunner001"
  def index
    @opening = Appointment.new
    @today = Time.current
    if @today.hour < 9
        @start = @today.change(hour:9)
    elsif @today.hour > 20
        @start = @today.advance(:days => 1)
        @start = @start.change(hour:9)
    else
        @start = @today.advance(:hours =>1)
        @start = @start.change(min:0)
    end

    #get currently scheduled appointments
    @appointment = Appointment.where("start >= :start_date", {start_date: @start})
    #loop through the next 5 days and setup the view object
    @startdate = @start
    @events = Hash.new
    (0..120).each do
      if @appointment.any? { |a| a.start == @start.to_formatted_s(:db) }
        @events[@start] = true
      else
        @events[@start] = false
      end
      @start += 20.minute
      if @start.hour > 20
        @start += 1.day
        @start = @start.change(hour:9)
      end
    end
    @enddate = @start
  end


  def create
    render plain: params[:opening]
    #@startdate = params[:startdate]
    #@enddate = params[:enddate]
    #puts @startdate
    #puts @enddate
  end
end
