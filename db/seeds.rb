# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.connection.tables.each do |table|
  if table != "ar_internal_metadata" && table != "schema_migrations"
    puts "Resetting auto increment ID for #{table} to 1"
    ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH 1")
  end
end
JoinTableTagGossip.destroy_all
JoinTableRecipientPm.destroy_all
Comment.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
Gossip.destroy_all
City.destroy_all
User.destroy_all

users_array = []
cities_array = []
gossips_array = []
tags_array = []
pms_array = []
comments_array = []

Faker::Config.locale = 'fr'

anonymous_user = User.new(first_name: "Anonymous",
                          last_name: "Anonymous",
                          description: "Utilisateur créé afin qu'il soit l'auteur associé à tous les potins créés dans l'application via la view new. C'est donc un Anonyme Anonyme.",
                          email: "anonymous@gmail.com",
                          age: Faker::Number.between(from: 14, to: 107)
                         )
users_array << anonymous_user

city = City.new(name: "Paris",
                zip_code: "75000"
               )
cities_array << city

anonymous_user.city = city

anonymous_user.save
city.save

n = 10

n.times do
  user = User.new(first_name: Faker::Name.unique.first_name,
                  last_name: Faker::Name.unique.last_name,
                  description: Faker::Lorem.characters(number: 140),
                  email: Faker::Internet.free_email,
                  age: Faker::Number.between(from: 14, to: 107)
                 )
  users_array << user

  city = City.new(name: Faker::Address.unique.city,
                  zip_code: (Faker::Number.between(from: 21, to: 95).to_s + Faker::Number.between(from: 100, to: 999).to_s)
                 )
  cities_array << city

  user.city = city

  user.save
  city.save
end

gossips_authors_ids_array = []
n.times do
  gossip1 = Gossip.new(title: Faker::Lorem.characters(number: 7).capitalize,
                       content: Faker::Lorem.sentences(number: rand(4)+1).join(' ')
                      )
  gossips_array << gossip1

  author_id = rand(2..users_array.length-1)
  gossip1.author = users_array[author_id - 1]
  puts "gossip1 author_id : #{author_id}"

  gossip2 = Gossip.new(title: Faker::Lorem.characters(number: 10).capitalize,
                       content: Faker::Lorem.sentences(number: rand(6)+1).join(' ')
                      )
  gossips_array << gossip2

  author_id = ([*2..11] - gossips_authors_ids_array).sample
  puts "gossip2 author_id : #{author_id}"
  gossip2.author = users_array[author_id - 1] # -1 car un index d'Array commence à 0 (contrairement à un id d'une séquence en auto-increment)
  gossips_authors_ids_array << author_id 

  tag = Tag.new(title: "#" + Faker::Lorem.word)
  tags_array << tag

  comment1 = Comment.new(content: Faker::Lorem.sentences(number: rand(4)+1).join(' '))
  comments_array << comment1

  comment1.author_id = rand(2..11)
  comment1.gossip_id = rand(1..20)

  comment2 = Comment.new(content: Faker::Lorem.sentences(number: rand(6)+1).join(' '))
  comments_array << comment2

  comment2.author_id = rand(2..11)
  comment2.gossip_id = rand(1..20)

  pm = PrivateMessage.new(content: Faker::Lorem.sentences(number: rand(4)+1).join(' '))
  pms_array << pm

  pm.sender_id = rand(2..11)

  JoinTableTagGossip.new(gossip: gossip1, tag: tag).save
  JoinTableTagGossip.new(gossip: gossip2, tag: tag).save
  
  JoinTableRecipientPm.new(private_message: pm, recipient: users_array[rand(1..users_array.length-1)]).save
  
  gossip1.save
  gossip2.save
  tag.save
  comment1.save
  comment2.save
  pm.save
end

#User.all
#City.all
#Gossip.all
#Tag.all
#PrivateMessage.all
#Comment.all

require 'table_print'

tp.set User, :id, :first_name, :last_name, :email, :age, "city.name", "city.zip_code", :description
tp.set Tag, :id, :title
tp.set Gossip, :id, :title, "author.first_name", "author.last_name", "tags.title", :content
tp.set PrivateMessage, :id, "sender.first_name", "sender.last_name", "recipients.first_name", "recipients.last_name", :content
tp.set Comment, :id, "author.first_name", "author.last_name", "gossip.title", :content

puts "\n#{users_array.length} users créés :\n"
tp User.all
puts "\n#{cities_array.length} cities créées :\n"
tp City.all
puts "\n#{gossips_array.length} gossips créés :\n"
tp Gossip.all
puts "\n#{tags_array.length} tags créés :\n"
tp Tag.all
puts "\n#{pms_array.length} private messages créés :\n"
tp PrivateMessage.all
puts "\n#{comments_array.length} comments créés :\n"
tp Comment.all
puts
