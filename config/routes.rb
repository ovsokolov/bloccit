Rails.application.routes.draw do
  resources :advertisements
  resources :posts

  get 'spamupdate' => 'posts#spamupdate'

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
