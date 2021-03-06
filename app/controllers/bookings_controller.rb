class BookingsController < ApplicationController
  before_action :set_pokemon

  def create
    @booking = Booking.new(booking_params)
    @booking.pokemon = @pokemon
    @booking.user = current_user
    authorize @booking
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
    params.require(:booking).permit(:start_time, :end_time)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
