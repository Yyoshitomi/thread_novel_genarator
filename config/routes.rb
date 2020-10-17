Rails.application.routes.draw do
  
  resources :topics

  namespace :api do
    resources :topics do
      get :generate_id, on: :collection
    end
    resources :posts
  end

  # For details on the DSL availablea within this file, see https://guides.rubyonrails.org/routing.html
end
