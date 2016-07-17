class TravelsController < ApplicationController
  def search
    debugger
    if params
      @travels = Travel.where(
        origin: params[:origin],
        destination: params[:destination]
      )
      @user_id = 1 #current_user.id
      @user = User.find(@user_id)

      @travels = @travels.sort_by{|e| e[:origin]}
      @travels = Kaminari.paginate_array(@travels).page(params[:page]).per(5)
      @signed_travels = User.find(@user_id).travels.pluck(:id)

      calculate_age(@user.birth_date)
      get_img_url(@user.facebook_image_url)

      render json: TravelSearchPresenter.new(@travels,@signed_travels).to_json
     
    end
  end

  def offer
    @user_id =  1 #current_user.id
    @cars = User.find(@user_id).cars # Temporal
    @travels = []
    @cars.each do |car|
      @travels += car.travels
    end
    @travels = @travels.sort_by{|e| e[:origin]}
    @travels = Kaminari.paginate_array(@travels).page(params[:page]).per(5)

    render json: TravelOfferedPresenter.new(@travels).to_json
  end

  def show
    @user_id =  1 #current_user.id
    @travel = Travel.find(params[:id]) # Temporal
    @signed_travels = User.find(@user_id).travels.pluck(:id)

    render json: TravelShowPresenter.new(@travel,@signed_travels).to_json
  end

  def create
    @user_id = 1 #current_user.id
    @travel = Travel.new(travel_params)
    @signed_travels = User.find(@user_id).travels.pluck(:id)
    @travel.save
    render json: TravelShowPresenter.new(@travel,@signed_travels).to_json
  end

  def update
    @user_id = 1 #current_user.id
    @travel = Travel.find(params[:id])
    @travel.update_attributes(travel_params)
    @signed_travels = User.find(@user_id).travels.pluck(:id)
    @travel.save
    render json: TravelShowPresenter.new(@travel,@signed_travels).to_json
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

  def calculate_age(birthdate)
    today = Time.now

    @age = today.year - birthdate.year
    @age = @age - 1 if (
      birthdate.month > today.month or
      (birthdate.month >= today.month and birthdate.day > today.day)
    )
  end

  def get_img_url(facebook_image_url)
    if facebook_image_url
      @profile_picture = facebook_image_url
    else
      @profile_picture = "avatar-placeholder.png"
    end
  end

end
