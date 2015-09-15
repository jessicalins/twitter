Rails.application.routes.draw do
  get 'mentions/show'

  get 'followers/index'
  get 'tweets/index'
  get 'search/index'
  post 'search/follow'

  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: "welcome#index"

  resources :tweets do 
    get :find_new_tweets, on: :collection
  end

  resources :users do
    resources :tweets 
    resources :follow do
      get :follow, on: :collection
      get :unfollow, on: :collection
      get :following, on: :collection
      get :followers, on: :collection
    end  
  end
end
