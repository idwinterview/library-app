LibraryApp::Application.routes.draw do
  root to: 'users#index', as: 'home'

  resources :users do
    collection do
      get :list
    end
  end

  resources :books do
    collection do
      get :list
      post :returned
      post :check_out
    end
  end
end
