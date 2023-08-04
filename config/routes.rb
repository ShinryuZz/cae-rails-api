Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      post "/auth", to: "authentications#create"
      post "/test", to: "authentications#test"
      resources :users
      resources :posts
    end
  end
end
