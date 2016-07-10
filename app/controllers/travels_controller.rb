class TravelsController < ApplicationController

  def search
    @travels = Travel.where(
      departure: params[:date_from]..params[:date_to],
      origin: params[:origin],
      destination: params[:destination]
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
      :description,
      :origin,
      :destination,
      :available_places)
  end
  
end
