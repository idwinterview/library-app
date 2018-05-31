LibraryApp::Application.routes.draw do
  match '' => 'users#index', :as => 'home'
  
  resources :users do
    collection do
      get :index
      get :list
      get :show
    end
  end
  
  resources :books do
    collection do
      get :list
      post :returned
    end
  end
end
