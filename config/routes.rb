LibraryApp::Application.routes.draw do
  
  resources :customers do
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
