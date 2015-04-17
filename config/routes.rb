Rails.application.routes.draw do
  devise_for :users
  root :to => 'posts#index'

  resources :posts do
    resources :votes, :only => [:create, :destroy]
    resources :comments, :except => [:index] do
      resources :votes, :only => [:create, :destroy]
    end
  end
end
