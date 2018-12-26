namespace :service do
  BASE_URL = 'https://fast-stream-52562.herokuapp.com/'

  desc 'Get all news from data_storage'
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

  desc "Search news by title and description"
  task :search, [:search_query] => :environment do |t, params|
    conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    req = {search: params[:search_query]}
    resp = conn.get "/api/search", req
    pp JSON.parse(resp.body)

    puts "Done."

  end
end