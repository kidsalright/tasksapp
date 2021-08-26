Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :tasks do
    get 'start', on: :member
    get 'complete', on: :member
    get 'cancel', on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
