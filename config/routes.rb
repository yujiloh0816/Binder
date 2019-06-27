
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :users do
    namespace :pc do
      root to: 'top#index'
      resources :lists, only: [:index, :show, :create, :destroy]
    end
    namespace :sp do
      root to: 'top#index'
      resources :lists, only: [:index, :show]
      resources :inspections, only: [:create]
      resources :matching, only: [:index]
    end
  end

  namespace 'api' do
    namespace 'v1' do
      get 'companies', to: 'companies#check_http_status'
    end
  end

end
