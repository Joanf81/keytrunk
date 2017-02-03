Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do  # /api/v1/..

      post '/login', to: "sessions#create"

      resources :users, except: [:new, :edit]
    end
  end


  get 'welcome/goindex'
  root :to => "welcome#goindex"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
