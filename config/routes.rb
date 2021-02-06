Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :groups do
    resources :expanses
  end  
  get "groups/:groups_id/add_firend_in_group" => "groups#add_firend_in_group", as: :add_firend_in_group

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
