class OrdersController < ApplicationController


  # before do
  #   @current_product = Product.find_by_id(params[:id])
  # end

  def cart
    if current_customer
      @cart_items = current_customer.find_products
    else
      root_path
    end
  end

  def add_to_cart
    current_product = Product.find_by_id(params[:id])
    order = Order.new(customer_id: current_customer.id, product_id: current_product.id, purchased: false)
    p order
    p "order above"
    if order.save
      redirect_to products_cart_path
    else
      session[:error] = "This item has not been saved to the cart."
      redirect_to back
    end
  end

end
