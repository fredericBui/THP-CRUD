# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Gossip.destroy_all
City.destroy_all

$numberOfCities = 10;
$numberOfUsers = 3;
$numberOfGossips = 5;

$numberOfCities.times do
    $randomCity = Faker::Address.city

    if $randomCity != City.find_by(name: $randomCity)
        $city = City.create(name: $randomCity )
    end
end

$numberOfUsers.times do
    $randomCharacter = Faker::TvShows::NewGirl.character
    if $randomCharacter != User.find_by(name: $randomCharacter)
        $user = User.create(name: $randomCharacter,email: "#{$randomCharacter}@gmail.com", city: City.find( 1 + rand($numberOfCities - 1) ))
    end
end

$numberOfGossips.times do
    Gossip.create(content: Faker::TvShows::NewGirl.quote, user: User.find( 1 + rand($numberOfUsers - 1) ) )
end