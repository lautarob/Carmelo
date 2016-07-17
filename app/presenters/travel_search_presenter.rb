class TravelSearchPresenter

  def initialize(travels,signed_travels)
    @travels = travels
    @signed_travels = signed_travels
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
      @travel["user_information"]["facebook_image_url"] = "https://scontent-gru2-1.xx.fbcdn.net/v/t1.0-1/p160x160/11145132_10205360839360562_6349584530426372487_n.jpg?oh=8adaed225af46f0b20cbe49bb891f5ba&oe=57EEE236"
      @travel["user_information"]["gender"] = travel.car.user.gender
      @travel["user_information"]["birth_date"] = travel.car.user.birth_date
      @travel["user_information"]["age"] = 20


      @travel["travel_information"] = {}
      @travel["travel_information"]["id"] = travel.id
      @travel["travel_information"]["available_places"] = travel.available_places
      @travel["travel_information"]["signed"] = @signed_travels.include?(travel.id)

      @travel["car_information"] = {}
      @travel["car_information"]["model"] = travel.car.model
      @travel["car_information"]["year"] = travel.car.year
      @travel["car_information"]["places"] = travel.car.places

      @travels_to_send << @travel

    end

    return @travels_to_send
  end

end