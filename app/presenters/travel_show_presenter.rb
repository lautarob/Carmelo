class TravelShowPresenter < BasePresenter

  def initialize(travel,signed_travels)
    @travel = travel
    @signed_travels = signed_travels
  end

  def as_json(*)
    return to_hash
  end

  def to_hash
    @travel_to_send =  Hash.new
    
    @travel_to_send["user_information"] = {}

    @travel_to_send["user_information"]["id"] = @travel.car.user.id
    @travel_to_send["user_information"]["firstname"] = @travel.car.user.first_name
    @travel_to_send["user_information"]["lastname"] = @travel.car.user.last_name
    @travel_to_send["user_information"]["facebook_url"] = @travel.car.user.facebook_url
    @travel_to_send["user_information"]["facebook_image_url"] = "https://scontent-gru2-1.xx.fbcdn.net/v/t1.0-1/p160x160/11145132_10205360839360562_6349584530426372487_n.jpg?oh=8adaed225af46f0b20cbe49bb891f5ba&oe=57EEE236"
    @travel_to_send["user_information"]["gender"] = @travel.car.user.gender
    @travel_to_send["user_information"]["birth_date"] = @travel.car.user.birth_date
    @travel_to_send["user_information"]["age"] = age(@travel.car.user.birth_date)


    @travel_to_send["car_information"] = {}
    @travel_to_send["car_information"]["model"] = @travel.car.model
    @travel_to_send["car_information"]["year"] = @travel.car.year
    @travel_to_send["car_information"]["places"] = @travel.car.places

    @travel_to_send["travel_information"] = {}
    @travel_to_send["travel_information"]["id"] = @travel.id
    @travel_to_send["travel_information"]["origin"] = @travel.origin
    @travel_to_send["travel_information"]["destination"] = @travel.destination
    @travel_to_send["travel_information"]["description"] = @travel.description
    @travel_to_send["travel_information"]["departure"] = @travel.departure
    @travel_to_send["travel_information"]["available_places"] = @travel.available_places
    @travel_to_send["travel_information"]["signed"] = @signed_travels.include?(@travel.id)


    @travel_to_send["car_information"]["signed_users"] = []



    @travel.users.each do |user|
      @user = Hash.new

      @user["id"] = user.id
      @user["name"] = user.first_name
      @user["lastname"] = user.last_name
      @user["gender"] = user.gender
      @user["birth_date"] = user.birth_date
      @user["age"] = age(user.birth_date)
      @user["facebook_url"] = user.facebook_url
      @user["facebook_image_url"] = "https://scontent-gru2-1.xx.fbcdn.net/v/t1.0-1/p160x160/11145132_10205360839360562_6349584530426372487_n.jpg?oh=8adaed225af46f0b20cbe49bb891f5ba&oe=57EEE236"


      @travel_to_send["car_information"]["signed_users"] << @user

    end

    return @travel_to_send
  end

end