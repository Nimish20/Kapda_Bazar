Rails.application.routes.draw do

  devise_for :sellers, path: 'sellers', controllers: 
        { registrations: 'sellers/registrations', sessions: 
        'sellers/sessions',confirmations: 'sellers/confirmations' }
  get 'welcome/index'
 
  resources :categories
  resources :products
  resources :customers
  resources :stores
  resources :sellers do
    member do
      get :confirm_email
    end
  end

  root 'welcome#index'
end
