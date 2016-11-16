Rails.application.routes.draw do
  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'

  resources :posts do
    resources :comments
  end

  resources :users, only: [:new, :create, :edit, :update]
  resources :password_resets, only: [:new, :edit, :update]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
