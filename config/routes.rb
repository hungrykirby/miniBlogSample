Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  # resources :display_users do
  #   member do
      # get 'display_users/:id', to: 'display_users#show'
  #     get 'display_user_content/:display_user_content_id/edit', to: 'display_user_contents#edit', as: 'display_user_contents'
  #     get 'display_user_content/new', to: 'display_user_contents#new'
  #   end
  # end
  # resources :display_user_contents do
  #   member do
  #   end
  # end
  resources :blogs do
    member do
      # get 'show'
    end
  end

  namespace :admins do
    resources :display_users do
      resources :display_user_contents
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
    # get 'admin/display_user/:id/edit', to: 'display_users#edit'
  end
end
