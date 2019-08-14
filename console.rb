# frozen_string_literal: true

require('pry')
require_relative('models/artist')
require_relative('models/album')

artist1 = Artist.new('name' => 'Nirvana')
artist2 = Artist.new('name' => 'Ariana Grande')
artist3 = Artist.new('name' => 'Dean Lewis')

binding.pry
nil
