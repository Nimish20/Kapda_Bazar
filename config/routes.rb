Rails.application.routes.draw do

  devise_for :sellers, path: 'sellers', controllers: 
        { registrations: 'sellers/registrations', sessions: 
        'sellers/sessions',confirmations: 'sellers/confirmations' }

  devise_for :customers, path: 'customers', controllers: 
        { registrations: 'customers/registrations', sessions:
        'customers/sessions',confirmations: 'customers/confirmations' }

  get 'welcome/index'

  resources :cart_items
  resources :orders
  resources :market_places do
    member do
      get 'product'
    end
  end

  resources :sellers do
    resources :products
    resources :delivery_boys
    member do
      get :confirm_email
    end
  end

  namespace :delivery_boys do
    resources :registrations
    resources :sessions
    resources :orders
  end

  root 'welcome#index'
end
