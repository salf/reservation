class ReservationsController < ApplicationController
  before_action :obtain_reservation, only: [:edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end


  def new
    @reservation = Reservation.new(table_id: params.fetch(:id, nil))
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      @reservation.save
      flash[:notice] = "Reservation added!"
      redirect_to reservations_path
    else
      alert = if @reservation.errors[:base].empty?
        'Reservation was not added.'
      else
        @reservation.errors[:base].first + ' Please choose another start and end times'
      end
      flash[:alert] = alert
      render action: :new
    end
  end

  def update
    if @reservation.update_attributes(reservation_params)
      flash[:notice] = "Reservation updated."
      redirect_to reservations_path
    else
      alert = if @reservation.errors[:base].empty?
        'Reservation was not updated.'
      else
        @reservation.errors[:base].first + ' Please choose another start and end times'
      end
      flash[:alert] = alert
      render action: :edit
    end
  end

  def edit
  end

  def destroy
    @reservation.destroy
    flash[:notice] = "Reservation was removed"
    redirect_to reservations_path
  end


  private

  def obtain_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(
      :table_id,
      :start_time,
      :end_time,
      :client_name
    )
  end

end
