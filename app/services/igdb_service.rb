require 'apicalypse'

IGDB_CLIENT_ID = ENV['IGDB_CLIENT_ID']
IGDB_ACCESS_TOKEN = ENV['IGDB_ACCESS_TOKEN']

IGDB_API_ENDPOINT = 'https://api.igdb.com/v4/games'.freeze
IGDB_REQUEST_HEADERS = {
  headers: {
    'client-id' => IGDB_CLIENT_ID,
    'authorization' => "Bearer #{IGDB_ACCESS_TOKEN}",
    'x-user-agent' => 'ruby-apicalypse'
  }
}.freeze
class IgdbService
  def self.search_games(query)
    api = Apicalypse.new(IGDB_API_ENDPOINT, IGDB_REQUEST_HEADERS)
    api
      .fields(:name, :total_rating)
      .where(category: 1)
      .search(query)
      .limit(2)
      .request
  end
end
