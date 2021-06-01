Rails.application.routes.draw do
  devise_for :users # takes care of the users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  # resources :users #, :only => [, :edit, :update] # another notation

  resources :profiles, only: :show
end
