Toy::Application.routes.draw do
  resources :users
  root :to => "users#index"

  resources :lunches do
    member do
      put 'take_down'
      put 'update_status'
    end
  end

end
