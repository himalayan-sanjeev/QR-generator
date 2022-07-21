Rails.application.routes.draw do
  root 'tickets#index'
  resources :tickets, only: %i[index create new show download]
end
