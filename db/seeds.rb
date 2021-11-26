# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
Friendship.destroy_all
CollectionRestaurant.destroy_all
Collection.destroy_all
Note.destroy_all
User.destroy_all
Restaurant.destroy_all

puts "every data is destroyed"

User.create(email: 'user1@mail.com', password: '123456', first_name: 'John', last_name: 'Doe', avatar_url: 'https://picsum.photos/50/50', location: "Milan")
user2 = User.create(email: 'user2@mail.com', password: '123456', first_name: 'Davide', last_name: 'Oldani', avatar_url: 'https://picsum.photos/50/50', location: "Milan")
puts '2 users created'

i = 4
20.times do
  puts i
  user = User.new(
    email: "user#{i}@mail.com",
    password: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar_url: 'https://picsum.photos/50/50',
    location: ['Milan', 'Paris'].sample
  )
  user.save!
  i += 1
end

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

restaurant11 = Restaurant.new(
  name: "Les Deux Magots",
  street_address: "6 Pl. Saint-Germain des Prés 36",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 45 48 55 25",
  photo: "https://storage.googleapis.com/yk-cdn/photos/pdp/vutheara-kham/paris-by-night-les-deux-magots-paris.jpg"
)
restaurant11.save!

restaurant12 = Restaurant.new(
  name: "La Rotonde",
  street_address: "105 Bd du Montparnasse",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 43 26 48 26",
  photo: "https://resize.marianne.net/r/1540,924/img/var/LQ3019545C/380053/rotonde.jpeghttp://www.santamarialanave.com/wp-content/uploads/2016/06/Plateau-di-ostriche-e-ricci.jpeg"
)
restaurant12.save!

restaurant13 = Restaurant.new(
  name: "Pink Mamma",
  street_address: "20bis Rue de Douai",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 47 42 33 31",
  photo: "https://www.redline-boutique.com/wp/wp-content/uploads/2017/06/redline-blog-pink-mamma-restaurant-paris.png"
)
restaurant13.save!

restaurant14 = Restaurant.new(
  name: "Restaurant Diep",
  street_address: "55 Rue Pierre Charron",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 45 63 52 76",
  photo: "https://lh3.googleusercontent.com/p/AF1QipNaJGIfGZHm_lBkYCT5wi6ofrZOEIP3gyhm6azN=s1280-p-no-v1"
)
restaurant14.save!

restaurant15 = Restaurant.new(
  name: "Le Relais de l'Entrecôte Marbeuf",
  street_address: "15 Rue Marbeuf",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 49 52 07 17",
  photo: "https://media-cdn.tripadvisor.com/media/photo-s/05/30/4b/a0/le-relais-de-l-entrecote.jpg"
)
restaurant15.save!

restaurant16 = Restaurant.new(
  name: "Aux Crus de Bourgogne",
  street_address: "3 Rue Bachaumont",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 42 33 48 24",
  photo:"https://1.bp.blogspot.com/-YlUssWERvzY/YOcu1le4UFI/AAAAAAABaiI/DchOLp73bHIW4PowtdRKpQ5Ihrglc8orQCLcBGAsYHQ/s800/aux-crus-de-bourgogne-restaurant-brasserie-rue-bachaumont-montorgueil-paris-2-1.JPG"
)
restaurant16.save!

restaurant17 = Restaurant.new(
  name: "Bouillon Pigalle",
  street_address: "22 Bd de Clichy",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 42 59 69 31",
  photo: "https://www.bouillon-chartier.com/chartier_contents/uploads/2019/07/bouillon-chartier-grands-boulevards-canard.jpg"
)
restaurant17.save!

restaurant18 = Restaurant.new(
  name: "Balagan Paris",
  street_address: "9 Rue d'Alger",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 40 20 72 14",
  photo: "http://www.balagan-paris.com/thumbs/home/row-1/20170522_balagan_plates_test_0070_v2_v2-1000-8d7354ce25b8.jpg"
)
restaurant18.save!

restaurant19 = Restaurant.new(
  name: "Marco Polo",
  street_address: "1 Rue Saint-Sulpice,",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 43 26 79 63",
  photo: "https://www.restaurant-marcopolo.com/wa_p_albums/p_album_jd31msnc0/jd31kr3q1dtor5osyo/mp285.jpg"
)
restaurant19.save!

restaurant10 = Restaurant.new(
  name: "La Piadina",
  street_address: "31 Rue d'Anjou",
  city: "Paris",
  country: "France",
  phone_number: "+33 1 42 66 17 11",
  photo: "https://www.italiachiamaitalia.it/wp-content/uploads/2021/05/piadina-salame.jpg"
)
restaurant10.save!

i = 0
restaurant = Restaurant.all

5.times do
  note = Note.new(content: 'this is very good '*5, user: User.first, restaurant: restaurant[i])
  note.save!
  i+=1
end


collection1 = Collection.new(name: 'Milan', user: User.first)
collection1.save!

collection_restaurants1 = CollectionRestaurant.new(collection: collection1, restaurant: restaurant1)
collection_restaurants1.save!

x = User.first.id + 1
2.times do
  friendship_x = Friendship.new(user: User.first, friend_id: User.find(x).id, status: "confirmed")
  friendship_x.save!
  friendship_y = Friendship.new(user: User.find(x), friend_id: User.first.id, status: "confirmed")
  friendship_y.save!
  x += 1
end
2.times do
  friendship6 = Friendship.new(user: User.find(x), friend_id: User.first.id, status: "pending")
  friendship6.save!
  friendship7 = Friendship.new(user: User.first, friend_id: User.find(x).id, status: "pending")
  friendship7.save!
  x += 1
end
