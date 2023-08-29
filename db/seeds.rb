# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.delete_all

User.create(name: "test", email: "test@email.com", password: "testtest")
User.create(name: "test2", email: "test2@email.com", password: "testtest")
User.create(name: "test3", email: "test3@email.com", password: "testtest")
User.create(name: "test4", email: "test4@email.com", password: "testtest")
User.create(name: "test5", email: "test5@email.com", password: "testtest")
User.create(name: "test6", email: "test6@email.com", password: "testtest")

p "Users created: #{User.all.count}"