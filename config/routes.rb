Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/team'
  get 'welcome/help'

  resources :tags do
    resources :events
    get :newEvent, to: "tags#newEvent"
  end
  
  resources :events
  
  resources :calendar_views do
    get :previousMonth
    get :nextMonth
    get :thisMonth
    get :selectMonth
  end

  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
