Rails.application.routes.draw do

  #Routes for each page. Current Root is the home page
  root 'static_pages#home'
  
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/timetable', to: 'static_pages#timetable'
  
  get  '/signup',  to: 'users#new'
  get  '/students',  to: 'users#index'
  get  '/teachers',  to: 'users#index_teacher'
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'password_resets/new'
  get 'password_resets/edit'

  get  '/book_session',  to: 'free_play_rooms#new'
  get  '/current_sessions',  to: 'free_play_rooms#index'
  
  get  '/new_availability',  to: 'availabilities#new'
  get  '/my_availabilities',  to: 'availabilities#index'
  
  get  '/new_interview',  to: 'interviews#new'
  get  '/my_interviews',  to: 'interviews#index'
  
  get '/new_lesson',      to: 'lessons#new'
  get '/my_lessons',      to: 'lessons#index'
  
  get '/my_preferences',  to: 'preferences#index'
  get '/new_preference',  to: 'preferences#new'
  
  get '/my_skills',       to: 'skills#index'
  get '/new_skill',       to: 'skills#new'

  
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :free_play_rooms do
    member do
      get :delete
    end
  end
  
  resources :availabilities do
    member do
      get :delete
    end
  end
  
  resources :interviews do
    member do
      get :delete
    end
  end
  
  resources :lessons do
    member do
      get :delete
    end
  end
  
    resources :users do
    member do
      get :delete
    end
  end
  
  resources :preferences do
    member do
      get :delete
    end
  end
  
  resources :skills do
    member do
      get :delete
    end
  end
end
