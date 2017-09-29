module Spree
  module Api
    class CompleteOrdersController < Spree::Api::BaseController
      def create
        p params
      end 
      def show
        p params
        # @user = Spree::User.find(params[:id])
        # @order = Spree::Order.find(params[:id])
        # respond_with(@order)
      end
    end
  end
end