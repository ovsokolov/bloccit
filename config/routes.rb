Rails.application.routes.draw do
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, only: [:show, :edit, :new, :create, :update]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :questions

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirm' => 'users#confirm'

  get 'spamupdate' => 'posts#spamupdate'

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
