# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'json'

require 'faker'

Rent.destroy_all
Bike.destroy_all
User.destroy_all

BIKE_CATEGORY = ["VTT", "route", "enfant", "bmx", "ville"]
ADDRESS = ["16 villa gaudelet, Paris", "63 avenue parmentier, Paris", "Pigalle, Paris", "Eiffel Tower, Paris", "Montparnasse Cemetery, Paris", "23 Rue Blomet, Paris"]

data = URI.open(
  "https://api.99spokes.com/v1/bikes?include=images&limit=50",
  "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50TmFtZSI6ImdhdXRpZXJkYXZpZCIsInZlcnNpb24iOjEsImlhdCI6MTY2OTA2NTM2MX0.7L3CkzuqP3npwzeBh6UG2v77GSXXT5WkNdlM44ht4Ec"
).read

def translate_to_french(string)
  case string
  when "mountain" then BIKE_CATEGORY[0]
  when "road" then BIKE_CATEGORY[1]
  when "youth" then BIKE_CATEGORY[2]
  when "bmx" then BIKE_CATEGORY[3]
  when "urban" then BIKE_CATEGORY[4]
  end
end

bikes = JSON.parse(data)["items"].map do |bike|
  [
    URI.open(bike["images"].first["url"]),
    bike["maker"],
    translate_to_french(bike["category"])
  ]
end

user_prefix = ["az", "er", "ty", "qw"]

user_prefix.each do |el|
  p "Creating user and his bikes..."
  new_user = User.new(email: "#{el}@gmail.com", password: "123456789", phone_number: "0698876554")

  rand(1..5).times do
    bike_infos = bikes.sample
    bike = Bike.new(
      category: bike_infos[2],
      brand: bike_infos[1],
      address: ADDRESS.sample,
      status: true,
      price_per_day: rand(20..50).to_s,
      user: new_user
    )
    p bike_infos[0]
    bike.photos.attach(io: File.open(bike_infos[0]), filename: bike_infos[0], content_type: "image/jpeg")
    bike.save
  end
end
Rent.create(start_date: "2022-11-25", end_date: "2022-11-30", user: User.all.last, bike: Bike.all.first)
