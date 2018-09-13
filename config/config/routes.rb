LibraryApp::Application.routes.draw do
  devise_for :users

  match '' => 'users#index', :as => 'home'
  
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

  root to: "home#index"

end
