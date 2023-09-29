Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :profils

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'pages/view'
  get 'pages/dashboard'
  # Defines the root path route ("/")
  root 'pages#dashboard'
end
