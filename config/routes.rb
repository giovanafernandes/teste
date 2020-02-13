Rails.application.routes.draw do
  resources :colors
    namespace :api do
        namespace :v1 do
            resources :users, only: [:index, :create, :destroy, :update]
            resources :jobs, only: [:index, :create, :destroy, :update]
            resources :tasks, only: [:index, :create, :destroy, :update]
        end
    end

    resources :documents
    resources :presences
    resources :employees
    resources :jobs
    resources :diaries
    resources :weathers
    resources :schedules
    resources :tasks
    resources :works
    resources :contacts
    resources :companies
    resources :users
    resources :accesses
    resources :user_types
    resources :branches
    resources :memberships
    resources :access_keys
    resources :cards
    resources :sessions, only: [:new, :create, :destroy, :register, :signup]
    root 'home#index'


    get 'app', to: 'home#app', as: 'app'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'register', to: 'sessions#register', as: 'register'
    get 'works/spreadsheet/:id', to: 'works#spreadsheet', as: 'works/spreadsheet'
    post 'signup', to: 'sessions#signup', as: 'signup'
    post 'savecompany', to: 'memberships#create', as: 'savecompany'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
