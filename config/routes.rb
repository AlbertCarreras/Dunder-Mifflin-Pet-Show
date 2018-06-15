Rails.application.routes.draw do
  resources :dogs
  resources :employees

  get '/', to: "dogs#index"
end
