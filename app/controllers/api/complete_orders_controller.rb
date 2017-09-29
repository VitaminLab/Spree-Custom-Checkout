module Spree
  module Api
    module v1 
      class CompleteOrdersController < Spree::Api::BaseController
        def create
          p params
          respond_with(@order)
        end 
        def show
          p params
          respond_with(@order)
          # @user = Spree::User.find(params[:id])
          # @order = Spree::Order.find(params[:id])
          # respond_with(@order)
        end
      end
    end 
  end
end