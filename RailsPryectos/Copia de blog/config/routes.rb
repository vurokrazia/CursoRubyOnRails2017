Rails.application.routes.draw do
  get "articles/search"
  devise_for :users, controllers: {
	  registrations: "users/registrations",
	  sessions: "users/sessions",
	  passwords: "users/passwords"
	}
  resources :categories
  resources :articles do 
    resources :comments
  end
  post "contacts/new"
  get "welcome/contacto"
  resources :contacts, only: [:create, :new]
  root "articles#index"
end