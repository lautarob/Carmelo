u = User.create(email: 'lautaro@thehipstercloud.com', password: 'carmeloclub', password_confirmation: 'carmeloclub')
Car.create(year: 2012, user: u, slots: 5, model: 'Ford Fiesta')
u = User.create(email: 'matias@carmelo.club', password: 'carmeloclub', password_confirmation: 'carmeloclub')
Car.create(year: 2013, user: u, slots: 4, model: 'Kia Sport')
User.create(email: 'rodrigo@thehipstercloud.com', password: 'carmeloclub', password_confirmation: 'carmeloclub')

cities = ["tandil", "rauch", "azul", "barker", "buenos aires", "mar del plata", "bahia blanca"]
car = Car.all
users = User.all
30.times do |travel|
    t = Travel.create(city_origin: cities.sample,
                      city_destination: cities.sample,
                      car: car.sample,
                      departure: Time.now + 10.days,
                      travel_time: 10.0)
    t.users << users.sample
end
