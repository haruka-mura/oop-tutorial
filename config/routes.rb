Rails.application.routes.draw do
  resources :users
  get 'search', to: 'article_search#search'

  get    'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  mount LetterOpenerWeb::Engine, at: "/status/mail"
  resources :articles_categories
  resources :categories
  resources :articles
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
