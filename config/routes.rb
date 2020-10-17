Rails.application.routes.draw do
  namespace :api do
    get 'posts/create'
  end
  get 'hello_world', to: 'hello_world#index'
  get 'test', to: 'hello_world#test'

  namespace :api do
    resources :topics do
      get :generate_id, on: :collection
    end
  end

  resources :topics
  # For details on the DSL availablea within this file, see https://guides.rubyonrails.org/routing.html
end
