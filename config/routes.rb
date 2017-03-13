Rails.application.routes.draw do
root to: "dashboard#index"
# Good use here of root and custom routes. Only question is why the app
# needs both /home and /dashboard to route to dashboard#index?
get '/dashboard', to: 'dashboard#index'
get '/home', to: 'dashboard#index'
get '/assets', to: 'assets#index'
get '/expenses', to: 'expenses#index'

  devise_for :users
  resources :assets
  resources :expenses
end


# Prefix Verb   URI Pattern                    Controller#Action
# new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#  user_session POST   /users/sign_in(.:format)       devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
# new_user_password GET    /users/password/new(.:format)  devise/passwords#new
# edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
# user_password PATCH  /users/password(.:format)      devise/passwords#update
#               PUT    /users/password(.:format)      devise/passwords#update
#               POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
# new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
# edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
# user_registration PATCH  /users(.:format)               devise/registrations#update
#               PUT    /users(.:format)               devise/registrations#update
#               DELETE /users(.:format)               devise/registrations#destroy
#               POST   /users(.:format)               devise/registrations#create
#        assets GET    /assets(.:format)              assets#index
#               POST   /assets(.:format)              assets#create
#     new_asset GET    /assets/new(.:format)          assets#new
#    edit_asset GET    /assets/:id/edit(.:format)     assets#edit
#         asset GET    /assets/:id(.:format)          assets#show
#               PATCH  /assets/:id(.:format)          assets#update
#               PUT    /assets/:id(.:format)          assets#update
#               DELETE /assets/:id(.:format)          assets#destroy
#      expenses GET    /expenses(.:format)            expenses#index
#               POST   /expenses(.:format)            expenses#create
#   new_expense GET    /expenses/new(.:format)        expenses#new
#  edit_expense GET    /expenses/:id/edit(.:format)   expenses#edit
#       expense GET    /expenses/:id(.:format)        expenses#show
#               PATCH  /expenses/:id(.:format)        expenses#update
#               PUT    /expenses/:id(.:format)        expenses#update
#               DELETE /expenses/:id(.:format)        expenses#destroy
