class TravelSearchPresenter

  def initialize(travels)
    @travels = travels
  end

  def as_json(*)
    @travels_to_send =  []
    @travels.each do |travel|
      @travel =  Hash.new

      @travel["user_information"] = {}

      @travel["user_information"]["id"] = travel.car.user.id
      @travel["user_information"]["firstname"] = travel.car.user.first_name
      @travel["user_information"]["lastname"] = travel.car.user.last_name
      @travel["user_information"]["facebook_url"] = travel.car.user.facebook_url
      @travel["user_information"]["facebook_image_url"] = travel.car.user.facebook_image_url
      @travel["user_information"]["gender"] = travel.car.user.gender
      @travel["user_information"]["birth_date"] = travel.car.user.birth_date

      @travel["travel_information"] = {}
      @travel["travel_information"]["id"] = travel.id
      @travel["travel_information"]["available_places"] = travel.available_places

      @travel["car_information"] = {}
      @travel["car_information"]["model"] = travel.car.model
      @travel["car_information"]["year"] = travel.car.year
      @travel["car_information"]["places"] = travel.car.places

      @travels_to_send << @travel

    end

    return @travels_to_send
  end

end