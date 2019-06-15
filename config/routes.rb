
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

      resources :lists, only: [:index, :show, :destroy] do
        # ToDo
        # on: :memberにする必要があるけど
        # lists/:idをどうつくるかが課題
        # /users/pc/lists/:id/import(.:format)
        # import_users_pc_list_path
        # post :import, on: :member
        
        # import_users_pc_lists_path
        post :import, on: :collection

      end

    end
  end

end
