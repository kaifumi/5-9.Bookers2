Rails.application.routes.draw do
  root "books#top"
  get "home/about" => "books#about"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users

  resources :books,only:[:index,:create,:show,:edit,:update,:destroy]
  resources :users, only: [:index,:show, :edit,:update]
end
