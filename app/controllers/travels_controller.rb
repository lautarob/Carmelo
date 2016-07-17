class TravelsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def search
    if params
      @travels = Travel.where(
        origin: params[:origin],
        destination: params[:destination]
      )

      # get driver information from each travel
      @travels.each do |travel|
        car = Car.find(travel.car_id)

        get_user_info(car)
      end

      @amount = @travels.size

      @travels = @travels.sort_by{|e| e[:origin]}
      @travels = Kaminari.paginate_array(@travels).page(params[:page]).per(5)
      # @travels = @travels.page(params[:page]).per(5)

      # @signed_travels = User.find(@user_id).travels.pluck(:id) # Temporal
    end
  end

  def offer
    @user_id =  1 #current_user.id
    @cars = User.find(@user_id).cars # Temporal
    @travels = []
    @cars.each do |car|
      @travels += car.travels
    end
    @travels = Travel.order(sort_column + " " + sort_direction)
    @travels = Kaminari.paginate_array(@travels).page(params[:page]).per(5)
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

  # hardcoded - getting one driver info
  def get_user_info(car)
    @user = User.find(car.user_id)

    calculate_age(@user.birth_date)
    get_img_url(@user.facebook_image_url)
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

  def sort_column
    Travel.column_names.include?(params[:sort]) ? params[:sort] : "departure"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
