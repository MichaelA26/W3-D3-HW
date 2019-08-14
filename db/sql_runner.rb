# frozen_string_literal: true

require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      connection = PG.connect(dbname: 'music_library', host: 'localhost')
      connection.type_map_for_results = PG::BasicTypeMapForResults.new(connection)
      connection.prepare('query', sql)
      result = connection.exec_prepared('query', values)
    ensure
      connection&.close
    end
    result
  end
end
