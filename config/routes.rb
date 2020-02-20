Rails.application.routes.draw do

  devise_for :sellers, path: 'sellers', controllers: 
        { registrations: 'sellers/registrations', sessions: 
        'sellers/sessions',confirmations: 'sellers/confirmations' }
  get 'welcome/index'
 
  resources :customers
  resources :sellers do
    resources :products
    member do
      get :confirm_email
    end
  end

  root 'welcome#index'
end
