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

  def save
    sql = "
    INSERT INTO artists (name)
    VALUES ($1)
    RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end
end
