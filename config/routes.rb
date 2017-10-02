Rails.application.routes.draw do
  routes = lambda do
    namespace :api do
      namespace :v1 do 
        resources :complete_orders, only: (:show, :create)
      end
    end
  end 

  if Spree::Core::Engine.respond_to?(:add_routes)
    Spree::Core::Engine.add_routes(&routes)
  else
    Spree::Core::Engine.routes.draw(&routes)
  end
end
