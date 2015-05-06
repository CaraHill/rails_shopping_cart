class OrdersController < ApplicationController
  # before_action :require_login
  before_action :authenticate_customer!

  def cart
    @cart_items = current_customer.find_products
  end

  def add_to_cart
    current_product = Product.find_by_id(params[:id])
    order = Order.new(customer_id: current_customer.id, product_id: current_product.id, purchased: false)
    if order.save
      redirect_to products_cart_path
    else
      flash[:alert] = "This item has not been saved to the cart."
      redirect_to back
    end
  end

  def buy_now
    Order.where(customer_id: current_customer.id).destroy_all
    flash[:notice] = "You have purchased all items in your cart. Thank you for shopping with us."
    @cart_items = []
    redirect_to products_cart_path
  end

  def remove_from_cart
    current_product = Product.find_by_id(params[:id])
    Order.where(product_id: current_product.id).destroy_all
    redirect_to products_cart_path
  end

  # private
  # def require_login
  #   unless current_customer
  #     flash[:alert] = "You must be logged in to access this section."
  #     redirect_to new_customer_session_url
  #   end
  # end
end
