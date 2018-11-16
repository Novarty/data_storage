class NewsController < ApplicationController
  def index
    render json: NewsItem.all
  end
end