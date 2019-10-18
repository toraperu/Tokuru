# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#ジャンルseed
Genre.create!(name: "design")
Genre.create!(name: "art")
Genre.create!(name: "music")
Genre.create!(name: "fashion")
Genre.create!(name: "programming")
Genre.create!(name: "language")
Genre.create!(name: "love")
Genre.create!(name: "business")
Genre.create!(name: "WEBdesign")
Genre.create!(name: "consulting")
Genre.create!(name: "lisence")
Genre.create!(name: "others")


#admin
admin = Admin.new(:email => 'admin@tokuru.com', :password => 'secret')
admin.save!

