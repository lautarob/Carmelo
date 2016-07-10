class TravelsController < ApplicationController

  def search
    @travels = Travel.where(
      departure: params[:date_from]..params[:date_to],
      city_destination: params[:city_destination],
      province_destination: params[:province_destination],
      country_destination: params[:country_destination],
      city_origin: params[:city_origin],
      province_origin: params[:province_origin],
      country_origin: params[:country_origin]
      )
    render json: TravelSearchPresenter.new(@travels).to_json
  end

  def show
    @travel = Travel.find(params[:id])
    render json: TravelPresenter.new(@travel).to_json
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.save
    render json: @travel
  end

  def update
    @travel = Travel.find(params[:id])
    @travel.update_attributes(travel_params)
    @travel.save
    render json: @travel
  end

  def destroy
    Travel.find(params[:id]).destroy
  end

private

  def travel_params
      params.require(:travel).permit(
      :departure,
      :travel_time,
      :description,
      :city_origin,
      :country_origin,
      :province_origin,
      :city_destination,
      :country_destination,
      :province_destination,
      :slots_remaining)
  end

  
end
