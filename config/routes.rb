Rails.application.routes.draw do
  
  get 'book_comments/show'
  get 'book_comments/new'
  get 'book_comments/index'
  get 'book_comments/edit'
  get '/' => 'root#top'
  get 'home/about' => 'root#about'
  root 'root#top'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
