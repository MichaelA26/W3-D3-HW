# frozen_string_literal: true

require('pry')
require_relative('models/artist')
require_relative('models/album')

artist1 = Artist.new('name' => 'Nirvana')
artist2 = Artist.new('name' => 'Ariana Grande')
artist3 = Artist.new('name' => 'Dean Lewis')

artist1.save
artist2.save
artist3.save

album1 = Album.new(
  'title' => 'Nevermind',
  'genre' => 'Grunge',
  'artist_id' => artist1.id
)

album2 = Album.new(
  'title' => 'Sweetener',
  'genre' => 'Contemporary R&B',
  'artist_id' => artist2.id
)

album3 = Album.new(
  'title' => 'A Place We Knew',
  'genre' => 'Pop Music',
  'artist_id' => artist3.id
)

album1.save
album2.save
album3.save

album3.title = 'testing testing'
album3.update

artist3.name = 'testing testing'
artist3.update

artist2.delete

album1.delete

binding.pry
nil
