Rails.application.routes.draw do
  devise_for :users # takes care of the users
  
  authenticated :user do
    root 'profiles#dashboard', as: :authenticated_root
  end
  
  root to: 'pages#home'

  get '/dashboard', to: 'profiles#dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [] do # [] not making a show
    resources :messages, only: :create

  end

  resources :gift_requests do
    resource :chatrooms, only: :show # singular -> omits the id at the end
    collection do
      get 'my_requests'
    end
    member do
      patch :change_status
      patch :accept
    end
    resources :reviews, only: [:create]
  end

  resources :profiles, only: :show
end
