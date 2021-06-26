Rails.application.routes.draw do
  post :login, to: "user_session#create"
  get :login, to: "user_session#new"
  delete :logout, to: "user_session#destroy"

  root to: "home#index"
end
