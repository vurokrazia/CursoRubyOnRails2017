# == Route Map
#
#                   Prefix Verb   URI Pattern                                       Controller#Action
#         product_myimages GET    /products/:product_id/myimages(.:format)          myimages#index
#                          POST   /products/:product_id/myimages(.:format)          myimages#create
#      new_product_myimage GET    /products/:product_id/myimages/new(.:format)      myimages#new
#     edit_product_myimage GET    /products/:product_id/myimages/:id/edit(.:format) myimages#edit
#          product_myimage GET    /products/:product_id/myimages/:id(.:format)      myimages#show
#                          PATCH  /products/:product_id/myimages/:id(.:format)      myimages#update
#                          PUT    /products/:product_id/myimages/:id(.:format)      myimages#update
#                          DELETE /products/:product_id/myimages/:id(.:format)      myimages#destroy
#                 products GET    /products(.:format)                               products#index
#                          POST   /products(.:format)                               products#create
#              new_product GET    /products/new(.:format)                           products#new
#             edit_product GET    /products/:id/edit(.:format)                      products#edit
#                  product GET    /products/:id(.:format)                           products#show
#                          PATCH  /products/:id(.:format)                           products#update
#                          PUT    /products/:id(.:format)                           products#update
#                          DELETE /products/:id(.:format)                           products#destroy
#               categories GET    /categories(.:format)                             categories#index
#                          POST   /categories(.:format)                             categories#create
#             new_category GET    /categories/new(.:format)                         categories#new
#            edit_category GET    /categories/:id/edit(.:format)                    categories#edit
#                 category GET    /categories/:id(.:format)                         categories#show
#                          PATCH  /categories/:id(.:format)                         categories#update
#                          PUT    /categories/:id(.:format)                         categories#update
#                          DELETE /categories/:id(.:format)                         categories#destroy
#         new_user_session GET    /users/sign_in(.:format)                          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                         devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)                     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                    devise/passwords#edit
#            user_password PATCH  /users/password(.:format)                         devise/passwords#update
#                          PUT    /users/password(.:format)                         devise/passwords#update
#                          POST   /users/password(.:format)                         devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)                           devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)                          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                             devise/registrations#edit
#        user_registration PATCH  /users(.:format)                                  devise/registrations#update
#                          PUT    /users(.:format)                                  devise/registrations#update
#                          DELETE /users(.:format)                                  devise/registrations#destroy
#                          POST   /users(.:format)                                  devise/registrations#create
#           home_purchases GET    /home/purchases(.:format)                         home#purchases
#             home_history GET    /home/history(.:format)                           home#history
#           home_favorites GET    /home/favorites(.:format)                         home#favorites
#               home_index GET    /home/index(.:format)                             home#index
#       home_administrador GET    /home/administrador(.:format)                     home#administrador
#          home_reputation GET    /home/reputation(.:format)                        home#reputation
#            home_products GET    /home/products(.:format)                          home#products
#               home_sales GET    /home/sales(.:format)                             home#sales
#             home_summary GET    /home/summary(.:format)                           home#summary
#                     root GET    /                                                 home#index

Rails.application.routes.draw do
  resources :products do
    resources :myimages
  end
  resources :categories
  devise_for :users
  get 'home/purchases'
  get 'home/history'
  get 'home/favorites'
  get 'home/index'
  get 'home/administrador'
  get 'home/reputation'
  get 'home/products'
  get 'home/sales'
  get 'home/summary'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
