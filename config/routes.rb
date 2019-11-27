Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  resources :display_users do
    member do
      get 'display_users/:id/edit' => 'display_users#edit'
    end
  end
  resources :blogs do
    member do
      # get 'show'
    end
  end
  # devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  devise_scope :admin do
    get 'admin/:id', to: "admins/registrations#detail", as: 'admin'
    get 'signup', to: 'admins/registrations#new'
    get 'login', to: 'admins/sessions#new'
    get 'logout', to: 'admins/sessions#destroy'
    get 'adminpage', to: 'admins/registrations#adminpage'
  end
end
