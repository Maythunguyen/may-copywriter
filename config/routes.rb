Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes do
    collection do
      get :test_openai
    end
  end
end
