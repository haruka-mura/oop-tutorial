Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/status/mail"
  resources :articles_categories
  resources :categories
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
