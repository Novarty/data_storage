require 'news-api'
namespace "news_items" do 

  desc 'Fetch news item'
  task fetch: :environment do
    newsapi = News.new("91e9ca3c3dc34660a597f38dd988ec4f")

    date_today =  Date.today.strftime("%Y-%m-%d").to_s

    all_articles = newsapi.get_everything(
      sources: 'google-news-ru',
      from: date_today,
      to: date_today
    )

    all_articles.each do |article|
      NewsItem.create!(
        title: article.title,
        description: article.description,
        author: article.author,
        published_at: article.publishedAt,
        url: article.url,
        url_to_image: article.urlToImage
      )
    end

    puts 'Done.'
  end
end