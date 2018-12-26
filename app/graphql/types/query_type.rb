module Types
  class QueryType < Types::BaseObject
    field :news_item, NewsItemType, null: true do
      description "Find news by title"
      argument :title, String, required: true
    end

    def news_item(title:)
      NewsItem.find_by("title ILIKE ?", "%#{title}%")
    end
  end
end
