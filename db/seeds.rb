# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Comment.destroy_all
User.destroy_all
Gossip.destroy_all
City.destroy_all

$numberOfCities = 10;
$numberOfUsers = 8;
$numberOfGossips = 5;
$numberOfComments = 3;

$numberOfCities.times do
    $randomCity = Faker::Address.city

    if $randomCity != City.find_by(name: $randomCity)
        $city = City.create(name: $randomCity )
    end
end

$numberOfUsers.times do
    $randomName = Faker::Name.name
    $randomFirstName = Faker::Name.first_name
    $email = "#{$randomFirstName}.#{$randomName}@gmail.com"

    if $email != User.find_by(email: $email)
        
        $user = User.create(
            name: $randomName, 
            firstName: $randomFirstName,
            email: $email,
            age: rand(1..99),
            description: Faker::Lorem.sentence ,
            city: City.find( rand(1..$numberOfCities) )
        )

    end
end

$numberOfGossips.times do
    Gossip.create(
        title: Faker::Lorem.word,
        content: Faker::TvShows::NewGirl.quote, 
        user: User.find(rand(1..$numberOfUsers) ) 
    )
end

$numberOfComments.times do
    Comment.create( content: Faker::Lorem.word, user: User.last(), gossip: Gossip.last() )
end