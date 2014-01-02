Toy::Application.routes.draw do
  devise_for :users
  resources :users
  root :to => "welcome#index"

  resources :lunches do
    member do
      put 'take_down'
      put 'update_status'
      get 'match'
      put 'change_groups'
    end
    resources :groups
    collection do
      put 'show'
      put 'csv'
      put 'email'
    end
  end

end
