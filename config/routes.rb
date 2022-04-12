Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/companies', to: 'companies#index'
  get '/companies/total', to: 'companies#total'

  get '/business_structures', to: 'business_structures#index'
  get '/naics_codes/:id', to: 'naics_codes#show'

  root to: 'dashboard#home'
end
