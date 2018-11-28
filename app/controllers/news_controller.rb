class NewsController < ApplicationController
  def all
    news = NewsItem.all
    render json: { status: 'SUCCESS', message: 'Loaded all news', data: news }
  end

  def search
    search_query = params[:search].split.map { |v| "%#{v}%" }
    news = NewsItem.where("title ILIKE any (array[:sq]) OR description ILIKE any (array[:sq])", sq: search_query)

    render json: { status: 'SUCCESS', message: 'Loaded all news by title or description', data: news }
  end
end