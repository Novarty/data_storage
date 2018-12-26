module Types
  class NewsItemType < Types::BaseObject
    field :id, ID, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :author, String, null: true
    # field :published_at, Types::DateType, null: true
  end
end
