Toy::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    member do
      get 'add_me'
      get 'not_me'
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
      put 'change_groups'
    end
    resources :groups do
      collection do
        put 'show'
        get 'change_groups'
        put 'change'
        put 'csv'
        get 'email'
      end
    end
  end

end
