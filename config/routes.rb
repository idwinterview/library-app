LibraryApp::Application.routes.draw do
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

  get '/customer_book_counts', to: "reports#customer_book_counts"
end
