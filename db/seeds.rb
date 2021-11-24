# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
User.destroy_all
Restaurant.destroy_all

puts "every data is destroyed"

User.create(email: 'user1@mail.com', password: '123456', first_name: 'John', last_name: 'Doe', avatar_url: 'https://picsum.photos/50/50', location: "Milan")
User.create(email: 'user2@mail.com', password: '123456', first_name: 'Davide', last_name: 'Oldani', avatar_url: 'https://picsum.photos/50/50', location: "Milan")
puts '2 users created'

restaurant1 = Restaurant.new(
  name: "Al Garghet",
  street_address: "Via Selvanesco, 36",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 534698",
  photo: "https://amilanopuoi.com/wp-content/uploads/2018/11/A-Milano-puoi_Al-Garghet-Milano-3-1024x768.jpg"
)
restaurant1.save!

restaurant2 = Restaurant.new(
  name: "Langosteria Café Milano",
  street_address: "Galleria del Corso, 4",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 7601 8167",
  photo: "http://www.santamarialanave.com/wp-content/uploads/2016/06/Plateau-di-ostriche-e-ricci.jpeg"
)
restaurant2.save!

restaurant3 = Restaurant.new(
  name: "Gino Sorbillo",
  street_address: "Largo Corsia dei Servi, 11",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 4537 5930",
  photo: "https://www.scattidigusto.it/wp-content/uploads/2014/10/Gino-Sorbillo-e-Gennaro-Salvo-Milano.jpg"
)
restaurant3.save!

restaurant4 = Restaurant.new(
  name: "Temakinho Milan Brera",
  street_address: "Corso Garibaldi, 59",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 7201 6158",
  photo: "https://i1.wp.com/alchimiadelgusto.it/wp-content/uploads/2019/08/Logo-tema.jpg?resize=863%2C495&ssl=1"
)
restaurant4.save!

restaurant5 = Restaurant.new(
  name: "Obicà Mozzarella Bar",
  street_address: "Via Mercato, 28",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 8645 0568",
  photo: "https://assets-global.website-files.com/59baab33dea09c0001ac218f/5bbdb307443a1c88fb58df13_obica-mozzarella-bar-eventi-privati-aziendali.jpg"
)
restaurant5.save!

restaurant6 = Restaurant.new(
  name: "Eataly",
  street_address: "Piazza Venticinque Aprile, 10",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 4537 5930",
  photo:"https://www.lucianopignataro.it/wp-content/uploads/2020/10/Pizze-d%E2%80%99Italia-in-festa.png"
)
restaurant6.save!

restaurant7 = Restaurant.new(
  name: "C'era una volta una piada",
  street_address: "Piazza S. Gioachimo, 5",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 351 837 8571",
  photo: "https://d1ralsognjng37.cloudfront.net/cec9e56c-7eb3-4d88-8dce-3c9ab7cd73c8.jpeg"
)
restaurant7.save!

restaurant8 = Restaurant.new(
  name: "Cracco Ristorante",
  street_address: "Corso Vittorio Emanuele II",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 876 774",
  photo: "https://reportergourmet.com/files/2016/11/carlo-cracco-ovo-copertina-970.jpg"
)
restaurant8.save!

restaurant9 = Restaurant.new(
  name: "L'Antica Pizzeria Da Michele",
  street_address: "Piazza della Repubblica, 27",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 4537 5930",
  photo: "https://www.dissapore.com/wp-content/uploads/2020/10/antica-pizzeria-da-michele.jpg"
)
restaurant9.save!

restaurant10 = Restaurant.new(
  name: "Trattoria del Pescatore",
  street_address: "Via Atto Vannucci, 5",
  city: "Milano",
  country: "Italy",
  phone_number: "+39 02 5832 0452",
  photo: "https://vivimilano.corriere.it/wp-content/uploads/2012/02/trattoria-del-pescatore-2.jpg?v=138766"
)
restaurant10.save!

i = 0
restaurant = Restaurant.all

5.times do
  note = Note.new(content: 'this is very good '*5, user: User.first, restaurant: restaurant[i])
  note.save!
  i+=1
end

5.times do
  note = Note.new(content: 'this is very good '*5, user: User.last, restaurant: restaurant[i])
  note.save!
  i+=1
end

collection1 = Collection.new(name: 'Milan', user: User.first)
collection1.save!
collection_restaurants1 = CollectionRestaurant.new(collection: collection1, restaurant: restaurant1)
collection_restaurants1.save!
