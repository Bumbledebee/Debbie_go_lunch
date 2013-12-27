Toy::Application.routes.draw do
  resources :users
  root :to => "users#index"

  resources :lunches do
    member do
      put 'match'
      put 'update_status'
    end
  end

end
