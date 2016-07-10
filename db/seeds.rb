u = User.create(gender: "hombre", first_name: "Lautaro", last_name: "Bertuzzi", birth_date: "1992-08-14",  email: 'lautaro@thehipstercloud.com', password: 'carmeloclub', password_confirmation: 'carmeloclub')
Car.create(year: 2012, user: u, places: 5, model: 'Ford Fiesta')
u = User.create(gender: "hombre", first_name: "Matias", last_name: "Calvo", birth_date: "1993-09-15", email: 'matias@carmelo.club', password: 'carmeloclub', password_confirmation: 'carmeloclub')
Car.create(year: 2013, user: u, places: 4, model: 'Kia Sport')
u = User.create(gender: "hombre", first_name: "Rodrigo", last_name: "Rotonda", birth_date: "1991-05-10", email: 'rodrigo@thehipstercloud.com', password: 'carmeloclub', password_confirmation: 'carmeloclub')
Car.create(year: 2016, user: u, places: 4, model: 'Citroen DS3')

cities = ["tandil", "rauch", "azul", "barker", "buenos aires", "mar del plata", "bahia blanca"]
car = Car.all
users = User.all
30.times do |travel|
    t = Travel.create(origin: cities.sample,
                      destination: cities.sample,
                      car: car.sample,
                      departure: Time.now + 10.days)
    t.users << users.sample
end
