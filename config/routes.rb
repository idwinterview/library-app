LibraryApp::Application.routes.draw do
  match '' => 'users#index', :as => 'home'
  
  resources :users do
    collection do
      get :list, :customer
    end
  end
  
  resources :books do
    collection do
      get :list
      post :returned
    end
  end
end
