Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "rails_admin/main#dashboard"

  post "/graphql", to: "graphql#execute"

  scope '/api' do
    get '/get_news', to: 'news#all'
    post '/search', to: 'news#search'
  end
end
