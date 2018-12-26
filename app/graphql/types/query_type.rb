module Types
  class QueryType < Types::BaseObject
    field :news_item, [NewsItemType], null: true do
      description "Find news by title"
      argument :title, String, required: true
    end

    def news_item(title:)
      NewsItem.where("title ILIKE ?", "%#{title}%")
    end

    field :all_news, [NewsItemType], null: true do
      description "Get all news"
    end

    def all_news
      NewsItem.all
    end
  end
end
