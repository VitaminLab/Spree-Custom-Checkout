Rails.application.routes.draw do
  routes = lambda do
    namespace :admin do
      resources :complete_orders
    end
  end 

  if Spree::Core::Engine.respond_to?(:add_routes)
    Spree::Core::Engine.add_routes(&routes)
  else
    Spree::Core::Engine.routes.draw(&routes)
  end
end
