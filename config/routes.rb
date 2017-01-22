Rails.application.routes.draw do
  devise_for :users
  resources :invoices do
    collection do
      get :detect
    end
  end

  get '/invoices/homepage', to: 'invoices#homepage'

  root 'invoices#homepage'
end
