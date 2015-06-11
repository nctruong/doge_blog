Rails.application.routes.draw do
  devise_for :users
  root :to => 'posts#index'

  resources :posts do
    post 'vote'
    resources :comments, :except => [:index] do
      post 'vote'
    end
  end
end
