class TravelPresenter

  def initialize(travel)
    @travel = travel
  end

  def as_json(*)
    
    @travel_to_send =  Hash.new
    
    @travel_to_send["user_information"] = {}

    @travel_to_send["user_information"]["id"] = @travel.car.user.id
    @travel_to_send["user_information"]["firstname"] = @travel.car.user.first_name
    @travel_to_send["user_information"]["lastname"] = @travel.car.user.last_name
    @travel_to_send["user_information"]["facebook_url"] = @travel.car.user.facebook_url
    @travel_to_send["user_information"]["facebook_image_url"] = @travel.car.user.facebook_image_url
    @travel_to_send["user_information"]["gender"] = @travel.car.user.gender
    @travel_to_send["user_information"]["birth_date"] = @travel.car.user.birth_date

    @travel_to_send["car_information"] = {}
    @travel_to_send["car_information"]["model"] = @travel.car.model
    @travel_to_send["car_information"]["year"] = @travel.car.year
    @travel_to_send["car_information"]["places"] = @travel.car.places

    @travel_to_send["travel_information"] = {}
    @travel_to_send["travel_information"]["id"] = @travel.id
    @travel_to_send["travel_information"]["description"] = @travel.description
    @travel_to_send["travel_information"]["departure"] = @travel.departure
    @travel_to_send["travel_information"]["available_places"] = @travel.available_places

    @travel_to_send["car_information"]["signed_users"] = []



    @travel.users.each do |user|
      @user = Hash.new

      @user["id"] = user.id
      @user["name"] = user.first_name
      @user["lastname"] = user.last_name
      @user["gender"] = user.gender
      @user["birth_date"] = user.birth_date
      @user["facebook_url"] = user.facebook_url
      @user["facebook_image_url"] = user.facebook_image_url

      @travel_to_send["car_information"]["signed_users"] << @user

    end

    return @travel_to_send
  end

end