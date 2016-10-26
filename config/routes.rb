Rails.application.routes.draw do
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, only: [:show, :edit, :new, :create, :update]
  end
  resources :questions

  get 'spamupdate' => 'posts#spamupdate'

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
