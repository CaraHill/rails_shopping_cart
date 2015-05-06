require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

    before do
      @customer = Customer.create(name: "Cara", email: Faker::Internet.email, password: Faker::Internet.password)
      sign_in(@customer)
    end

  describe "#cart" do

    describe "response" do
      it "responds successfully with an HTTP 200 status code" do
        get :cart
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the cart template" do
        get :cart
        expect(response).to render_template("cart")
      end
    end

    it "assigns products to an instance variable" do
      Product.create(name: "robot", image: "image",price: 2000, description: "old robot")
      get :cart
      expect(assigns(:cart_items)).to eq(Order.where(customer_id: @customer.id).all)
    end
  end

  describe "#add_to_cart" do
    it "adds a product to the cart" do
      product = Product.create(name: "robot", image: "image",price: 2000, description: "old robot")
      post :add_to_cart, id: product.id
      expect(Order.last.product_id).to eq(product.id)
    end
  end

  describe "#buy_now" do
    it "destroys the order" do
      post :buy_now, id: @customer.id
      expect(Order.all).to_not include(Order.where(customer_id: @customer.id))
    end
  end

  describe "#remove_from_cart" do
    it "removes the item from the cart" do
      product = Product.create(name: "robot", image: "image",price: 2000, description: "old robot")
      post :remove_from_cart, id: product.id
      expect(Order.all).to_not include(Order.where(product_id: product.id))
    end
  end

end
