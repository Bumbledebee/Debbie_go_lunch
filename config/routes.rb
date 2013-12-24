Toy::Application.routes.draw do
  resources :users
  root :to => "users#index"

  resources :lunches do
    member do
      get 'match'
    end
  end

end
