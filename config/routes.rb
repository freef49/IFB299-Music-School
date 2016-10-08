Rails.application.routes.draw do

  get 'free_play_rooms/index'
  get 'free_play_rooms/show'
  get 'free_play_rooms/new'
  get 'free_play_rooms/edit'
  get 'free_play_rooms/delete'

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

  resources :users
  resources :free_play_rooms do
    member do
      get :delete
    end
  end
    


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
