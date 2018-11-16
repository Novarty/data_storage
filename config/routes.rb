Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "rails_admin/main#dashboard"

  scope '/api' do
    get '/get_news', to: 'api#index'
  end
end
