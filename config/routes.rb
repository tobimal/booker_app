Rails.application.routes.draw do
   get "/top"=> "homes#top"
   root 'homes#top'
   get 'home/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
