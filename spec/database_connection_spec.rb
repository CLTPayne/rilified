require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'Sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'bridget_riley_test')
      DatabaseConnection.setup('bridget_riley_test')
    end
  end

  describe '.query' do
    it 'Executes a database query via Postgres' do
      connection = DatabaseConnection.setup('bridget_riley_test')
      query_string = "INSERT INTO artwork (name, gallery, url)
      VALUES ('Bridget Riley', 'Tate', 'https://www.tate.org.uk/art/images/work/P/P78/P78333_10.jpg');"
      expect(connection).to receive(:exec).with(query_string)
      DatabaseConnection.query(query_string)
    end
  end

end
