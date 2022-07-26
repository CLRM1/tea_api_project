# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
customer = Customer.create!(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
customer_1 = Customer.create!(first_name: "John", last_name: "Romero", email: "john@mail.com", address: "1505 South St. Denver, CO")