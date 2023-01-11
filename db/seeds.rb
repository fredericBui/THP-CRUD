# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Gossip.destroy_all

3.times do
    $randomCharacter = Faker::TvShows::NewGirl.character
    if $randomCharacter != User.find_by(name: $randomCharacter)
        $user = User.create(name: $randomCharacter,email: "#{$randomCharacter}@gmail.com")
    end
end

5.times do
    Gossip.create(content: Faker::TvShows::NewGirl.quote, user: User.find( 1 + rand(2) ) )
end