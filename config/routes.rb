Rails.application.routes.draw do
  get 'welcome/index'

  resources :tags do
    resources :events
  end
  
  resources :events
  
  resources :calendar_views do
    get :previousMonth
    get :nextMonth
    get :thisMonth
  end

  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
