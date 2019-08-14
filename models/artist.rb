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

  def self.all
    sql = 'SELECT * FROM artists;'
    result = SqlRunner.run(sql)
    result.map { |artist| Artist.new(artist) }
  end

  def albums
    sql = "SELECT * FROM albums
    WHERE artist_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result.map { |album| Album.new(album) }
  end

  def update
    sql = "UPDATE artists SET name = $1
    WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE from artists
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    Artist.new(result[0]) unless result.ntuples == 0
  end
end
