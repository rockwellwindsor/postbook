Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :comments
  resources :posts, only: [:show,:create,:edit,:new,:destroy,:update]
  devise_for :users
  root 'posts#index'
end
