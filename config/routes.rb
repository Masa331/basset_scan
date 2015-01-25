Rails.application.routes.draw do
  resources :invoices do
    collection do
      get :detect
    end
  end

  get '/invoices/homepage', to: 'invoices#homepage'

  root 'invoices#homepage'
end
