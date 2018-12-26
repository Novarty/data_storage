Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  post "/graphql", to: "graphql#execute"

  scope '/api' do
    get '/get_news', to: 'news#all'
    get '/search', to: 'news#search'
  end

  root to: "rails_admin/main#dashboard"
end
