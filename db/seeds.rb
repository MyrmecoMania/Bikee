# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Bike.destroy_all
User.destroy_all
arr = ["az", "er", "ty"]
arr.each do |el|
  new_user = User.new(email: "#{el}@gmail.com", password: "123456789")
  Bike.create(category: "VTT", address: "16 villa Gaudelet", status: true, price_per_day: 40, user: new_user)
  Bike.create(category: "VTT", address: "16 villa Gaudelet Paris", status: true, price_per_day: 40, user: new_user)
end
