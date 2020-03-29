Rails.application.routes.draw do
  root 'index#home'
  get 'sign_out', to: 'session#destroy'
  get 'auth/:provider/callback', to: 'session#googleAuth'
  get 'auth/failure', to: redirect('/')
  get 'sign_in', to: 'session#new'
  post 'log_in', to: 'session#create'
  patch 'users/:id/update_portrait', to: 'users#updatePortrait', as: 'update_portrait'
  patch 'users/:id/update_pwd', to: 'users#updatePassword', as: 'update_pwd'
  get 'profile', to: 'profile#show'
  get 'api/get_events', to: 'api#getEvents', as: 'get_events'
  post 'events/book', to: 'events#book', as: 'book_event'
  post 'events/cancel', to: 'events#cancel', as: 'cancel_event'
  post 'events/picture/upload/:id', to: 'events#add_img'
  post 'events/picture/delete/:id/:p_id', to: 'events#delete_img'
  resources :users
  resources :events
  resources :posts
  get ':user_id', to: 'index#show', as: 'index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
