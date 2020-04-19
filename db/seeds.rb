# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def artists_params
  {
      name: Faker::Artist.unique.name,
      image_url: Faker::Avatar.image
  }
end

def albums_params
  {
      name: Faker::Music.unique.album,
      image_url: Faker::LoremFlickr.image(size: "50x60"),
      released_at: Faker::Date.between(from: 10.years.ago, to: Date.today)
  }
end

def songs_params
  {
      name: Faker::Music::Phish.song,
      number: Faker::Number.between(from: 1, to: 20),
      preview_url: Faker::Internet.url
  }
end

10.times do
  artist = Artist.create(artists_params)
  5.times do
    album = artist.albums.create(albums_params)
    10.times do
      album.songs.create(songs_params)
    end
  end
end