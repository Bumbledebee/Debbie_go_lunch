Toy::Application.routes.draw do
  devise_for :users

  resources :users do
    member do
      put 'add_me'
      put 'not_me'
    end
  end

  resources :messages

  resources :departments
  resources :lunchgroupleaders
  root :to => "welcome#index"

  resources :lunches do
    member do
      put 'take_down'
      put 'update_status'
      get 'match'
    end
    resources :groups do
      collection do
        put 'show'
        get 'change_groups'
        put 'change'
        put 'csv'
        put 'email'
      end
    end
  end

end
