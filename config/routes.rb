Rails.application.routes.draw do
  resources :products

  root 'welcome#index'
  get "about" => "welcome#about"
end
