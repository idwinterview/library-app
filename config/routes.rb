LibraryApp::Application.routes.draw do
  match '', to: 'home#index'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'

  namespace :librarian do
    get 'dashboard', to: 'dashboard#dashboard'
    resources :users, only: [:show, :customer_books_report] do
      collection do
        get :customer_books_report
      end
    end
  end

  resources :users, only: [:show]

  resources :books, only: [:list, :returned] do
    collection do
      get :list
      post :returned
    end
  end
end
