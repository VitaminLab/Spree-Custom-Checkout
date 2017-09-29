Rails.application.routes.draw do
  mount Spree::Core::Engine, :at => '/'
  namespace :spree do
    namespace :api, defaults: { format: 'json' } do
      resources :complete_orders
    end
  end
end