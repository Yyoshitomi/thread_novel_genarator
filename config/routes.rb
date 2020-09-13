Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'test', to: 'hello_world#test'
  # For details on the DSL availablea within this file, see https://guides.rubyonrails.org/routing.html
end
