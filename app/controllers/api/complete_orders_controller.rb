module Spree
  module Api
    module v1 
      class CompleteOrdersController < Spree::Api::BaseController

        skip_before_action :authenticate_user
       

        def create
          authorize! :create, Order
          authorize! :create, Spree.user_class
          @user = Spree.user_class.new(user_params)
          order_user = if @current_user_roles.include?('admin') && order_params[:user_id]
                         Spree.user_class.find(order_params[:user_id])
                       else
                         current_api_user
          end

          #@user = Spree.user_class.new(user_params)
          #Create user if doesn't exist, otherwise return existing user. 
          @user = Spree::User.find_or_create_by(user_params) 
          if @user.save
            #Create New Order. 
            import_order_params = if @current_user_roles.include?('admin')
                              params[:order].present? ? params[:order].permit! : {}
                            else
                              order_params
            end
            #Create new order items.
          end
           
          if @order.save
            respond_with(@order, status: 201, default_template: :show)
          else
            invalid_resource!(@user)
          end
        end 
        

        def show
          p params
          respond_with(@order)
          # @user = Spree::User.find(params[:id])
          # @order = Spree::Order.find(params[:id])
          # respond_with(@order)
        end


        private

        def user_params
          if params[:order]
            fetch_user_params
            params.require(:user).permit(permitted_user_attributes |
                                           [bill_address_attributes: permitted_address_attributes,
                                            ship_address_attributes: permitted_address_attributes])
          else 
            {}
          end 
        end 

        def order_params
          if params[:order]
            normalize_order_params
            params.require(:order).permit(permitted_order_attributes)
          else
            {}
          end
        end

        def fetch_user_params 
          params[:user] = params[:order].delete(:user) if params[:order][:user]
        end 

        def normalize_order_params
          params[:order][:payments_attributes] = params[:order].delete(:payments) if params[:order][:payments]
          params[:order][:shipments_attributes] = params[:order].delete(:shipments) if params[:order][:shipments]
          params[:order][:line_items_attributes] = params[:order].delete(:line_items) if params[:order][:line_items]
          params[:order][:ship_address_attributes] = params[:order].delete(:ship_address) if params[:order][:ship_address]
          params[:order][:bill_address_attributes] = params[:order].delete(:bill_address) if params[:order][:bill_address]
        end

        def order_id
          super || params[:id]
        end

      end
    end 
  end
end