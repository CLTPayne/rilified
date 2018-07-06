require 'pg'

class DatabaseConnection

  attr_reader :connection

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
    # @connection.exec("DROP TABLE IF EXISTS artwork;")
    # @connection.exec("CREATE TABLE artwork (id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE, gallery VARCHAR(30), url VARCHAR(200));")
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end

end
