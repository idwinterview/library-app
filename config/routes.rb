# frozen_string_literal: true

LibraryApp::Application.routes.draw do
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
