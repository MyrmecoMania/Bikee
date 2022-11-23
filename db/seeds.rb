# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Rent.destroy_all
Bike.destroy_all
User.destroy_all

# "https://www.gimplearn.net/fun.php?q=bike"

# file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
# file = URI.open("https://www.gimplearn.net/fun.php?q=bike").read
# article = Article.new(title: "NES", body: "A great console")
# article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# article.save

arr = ["az", "er", "ty"]
PATH = "./app/assets/images/"
ADDRESS = ["16 villa gaudelet, Paris", "63 avenue parmentier, Paris", "Pigalle, Paris", "Eiffel Tower, Paris", "Montparnasse Cementery, Paris", "23 Rue Blomet, Paris"]
arr.each do |el|
  images = ["#{PATH}velo1.png", "#{PATH}velo2.png", "#{PATH}velo3.png", "#{PATH}velo4.png", "#{PATH}velo5.png", "#{PATH}velo6.png"]

  new_user = User.new(email: "#{el}@gmail.com", password: "123456789")

  p "Creating first bike"

  bike1 = Bike.new(category: "VTT", address: ADDRESS.sample, status: true, price_per_day: 40, user: new_user)
  bike1.photos.attach(io: File.open(images.sample), filename: "nes.png", content_type: "image/png")
  bike1.save
  p "First bike created"

  p "Creating second bike"

  bike2 = Bike.new(category: "VTT", address: ADDRESS.sample, status: true, price_per_day: 40, user: new_user)
  bike2.photos.attach(io: File.open(images.sample), filename: "nes.png", content_type: "image/png")
  bike2.save
  p "Second bike created"
end
