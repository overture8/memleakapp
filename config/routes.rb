Rails.application.routes.draw do
  root 'welcome#index'
  get '/profile', to: 'welcome#profile'
end
