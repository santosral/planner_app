Rails.application.routes.draw do
  get 'shared/navbar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  
  devise_scope :user do
    root "devise/sessions#new"
  end

  resources :categories do
    resources :tasks
  end
end
