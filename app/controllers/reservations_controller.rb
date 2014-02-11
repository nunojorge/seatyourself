class ReservationsController < ApplicationController
  before_filter :load_product
  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to restaurants_path, notice: 'Reservation created successfully'
    else
      render :action => :show
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :user_id, :reservation_time)
  end

  def load_product
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
