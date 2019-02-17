LibraryApp::Application.routes.draw do
  match '', to: 'home#index'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'

  resources :users do
    collection do
      get :list
    end
  end

  resources :books do
    collection do
      get :list
      post :returned
    end
  end
end
