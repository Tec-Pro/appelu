Rails.application.routes.draw do
  
  namespace :api, defaults: { format: "json"  } do
    namespace :v1 do
      resources :users, only: [:create]
      resources :reserves, except: [:new, :edit]
      resources :businesses, except: [:new, :edit] do
      	resources :services, except: [:new, :edit]
      	resources :days, controller: "customer_service_days", except: [:new, :edit]
      end 

       post "/users/login", to: "users#login"
       post "/users/recovery" to: "users#recovery"
		  
		  get "/services", to: "services#indexAll"
		  get "/myReserves", to: "users#reserves"
		     
    end
  end

  


end

