LibraryApp::Application.routes.draw do
  
  resources :customers do
    get '/customers/report', to: 'customers#reports'
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
