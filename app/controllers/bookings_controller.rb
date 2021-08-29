class BookingsController < ApplicationController
  before_action :set_pokemon

  def create
    @booking = Booking.new(booking_params)
    @booking.pokemon = @pokemon
    @booking.user = current_user
    if @booking.save
      flash[:notice] = "Cool! You booked this pokemon"
      redirect_to pokemon_path(@pokemon)
    else
      flash[:alert] = "Sorry! #{@booking.errors.full_messages.first}"
      redirect_to pokemon_path(@pokemon)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
