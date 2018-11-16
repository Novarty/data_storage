namespace :service do
  BASE_URL = 'https://pavlov-data-storage.herokuapp.com/'
  desc 'get all news items from data_storage'
  task get_all_news: :environment do
    conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    resp = conn.get "/api/get_news"
    pp JSON.parse(resp.body)

    puts "Done."
  end
end