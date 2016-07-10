class TravelOfferedPresenter

  def initialize(travels)
    @travels = travels
  end

  def as_json(*)
    @travels_to_send =  []
    @travels.each do |travel|
      @travel =  Hash.new

      @travel["travel_information"] = {}
      @travel["travel_information"]["id"] = travel.id
      @travel["travel_information"]["available_places"] = travel.available_places
      @travel["travel_information"]["origin"] = travel.origin
      @travel["travel_information"]["destination"] = travel.destination

      @travel["car_information"] = {}
      @travel["car_information"]["model"] = travel.car.model
      @travel["car_information"]["year"] = travel.car.year
      @travel["car_information"]["places"] = travel.car.places

      @travels_to_send << @travel

    end

    return @travels_to_send
  end

end