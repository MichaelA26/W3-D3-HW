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

binding.pry
nil
