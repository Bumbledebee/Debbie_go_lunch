Toy::Application.routes.draw do
  resources :users
  root :to => "welcome#index"

  resources :lunches do
    member do
      put 'take_down'
      put 'update_status'
      put 'match'
      get 'match'
      put 'groups'
      get 'groups'
      put 'change_groups'
    end
  end

end
