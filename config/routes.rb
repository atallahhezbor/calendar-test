CalendarTest::Application.routes.draw do

  resources :events, only: [:new, :create]
  root to: 'events#new' 

end

