# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
  [ "Lena", "Berger", "lena@new.com", "password" ],
  [ "Frank", "Noor", "frank@new.com", "password" ],
  [ "Ben", "Heidi", "ben@new.com", "password" ],
  [ "Nathan", "Kim", "nathan@new.com", "password" ],
  [ "Karl", "West", "karl@new.com", "password"],
  [ "Sally", "Reed", "sally@new.com", "password"],
  [ "Linda", "Chang", "linda@new.com", "password"],
  [ "Robert", "Carmel", "robert@new.com", "password"],
  [ "Max", "Phoebe", "max@new.com", "password"], 
  [ "Matt", "Mundi", "matt@new.com", "password"]
]

user_list.each do |first_name, last_name, email, password|
  User.create( first_name:first_name, last_name:last_name, email:email, password:password, password_confirmation:password )

end