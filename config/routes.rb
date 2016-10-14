Rails.application.routes.draw do
  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'

  resources :posts do
    resources :comments
  end
end
