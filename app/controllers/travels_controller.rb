class TravelsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def search
    if params
      @travels = Travel.where(
        origin: params[:origin],
        destination: params[:destination]
      )

      @amount = @travels.size

      @user_id = 1 #current_user.id
      @user = User.find(@user_id)

      @signed_travels = User.find(@user_id).travels.pluck(:id)

      @presenter = TravelSearchPresenter.new(@travels,@signed_travels).to_hash
      @presenter = Kaminari.paginate_array(@presenter).page(params[:page]).per(5)
    end
  end

  def offer
    @user_id =  1 #current_user.id
    @cars = User.find(@user_id).cars # Temporal
    @travels = []
    @cars.each do |car|
      @travels += car.travels
    end

    @travels = @travels.sort_by{|e| e[sort_column]}

    if sort_direction == "desc"
      @travels = @travels.reverse
    end

    @presenter =  TravelOfferedPresenter.new(@travels).to_hash
    @presenter = Kaminari.paginate_array(@presenter).page(params[:page]).per(5)
  end

  def show
    @user_id =  1 #current_user.id
    @travel = Travel.find(params[:id]) # Temporal
    @signed_travels = User.find(@user_id).travels.pluck(:id)

    @presenter =  TravelShowPresenter.new(@travel,@signed_travels).to_hash
  end

  def create
    @user_id = 1 #current_user.id
    @travel = Travel.new(travel_params)
    @signed_travels = User.find(@user_id).travels.pluck(:id)
    @travel.save
    @presenter = TravelShowPresenter.new(@travel,@signed_travels).to_hash
  end

  def update
    @user_id = 1 #current_user.id
    @travel = Travel.find(params[:id])
    @travel.update_attributes(travel_params)
    @signed_travels = User.find(@user_id).travels.pluck(:id)
    @travel.save
    @presenter = TravelShowPresenter.new(@travel,@signed_travels).to_hash
  end

  def destroy
    Travel.find(params[:id]).destroy
  end

private

  def travel_params
      params.require(:travel).permit(
      :car_id,
      :departure,
      :description,
      :origin,
      :destination,
      :available_places)
  end

  def sort_column
    Travel.column_names.include?(params[:sort]) ? params[:sort] : "departure"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
