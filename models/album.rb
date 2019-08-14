# frozen_string_literal: true

require_relative('artist')
require_relative('../db/sql_runner')

class Album
  attr_accessor(:title, :genre, :artist_id)
  attr_reader(:id)

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
    @id ||= options['id']
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def self.all
    sql = 'SELECT * FROM albums;'
    result = SqlRunner.run(sql)
    result.map { |album| Album.new(album) }
  end

  def artist
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    Artist.new(result[0])
  end

  def update
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3)
    WHERE id = $4;"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM albums
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    Album.new(result[0]) unless result.ntuples == 0
  end
end
