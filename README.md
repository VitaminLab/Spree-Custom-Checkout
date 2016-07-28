Spree Custome Checkout
====================

This is a custom checkout flow to merge:
* Sign up, Address, and Delivery on Same Page.
* Payment on another page.
* Then confirmation page.

`Spree 3.1.0` Required


The structure of `Spree` views remains in the same manner, with a pair of execciones:


* To display all the steps in one page, we overload `spree/checkout/edit.html.erb` our application. For these we are basically cycling on each step, the responsible for displaying each views correctly is the parcial `_form_wrapper`.

* We have overwritten the part that contains the login form to add a `hidden` parameters that allow us to discernir if we are in the checkout or not.

* The register view inside the checkout process is modified so that it appears as an extra step in the buying process


Installation
------------

Add spree_custom_checkout to your Gemfile:

```ruby
gem 'spree_custom_checkout'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_custom_checkout:install
```

Side Note:
-------

To enforce the flow include the follow code in a new decorator in your Spree App: `apps/models/spree/order_decorator.rb`:

```ruby
Spree::Order.class_eval do

     checkout_flow do
        go_to_state :address
        go_to_state :delivery
        go_to_state :payment, if: ->(order) {
            order.update_totals
            order.payment_required?
        }
        go_to_state :confirm #, :if => lambda { |order| order.confirmation_required? }
        go_to_state :complete
      end

end
```

