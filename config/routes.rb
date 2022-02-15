LibraryApp::Application.routes.draw do

  resources :users do
    collection do
      get :list
      get :user_type
    end
  end

  resources :books do
    collection do
      get :list
      post :returned
    end
  end
end

## TODO: 
#Add namespaces to connect to more Apps
