# frozen_string_literal: true

require_relative('album')
require_relative('../db/sql_runner')

class Artist
  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @name = options['name']
    @id ||= options['id']
  end
end
