require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe "#index" do

    describe "response" do
      before { get :index }

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response). to have_http_status(200)
      end

      it "renders the index template" do
        expect(response).to render_template("index")
      end
    end

    it "assigns products to an instance variable" do
      Product.create(name: "robot", image: "image",price: 2000, description: "old robot")
      get :index
      expect(assigns(:products)).to eq(Product.all)
    end

  end

  describe "#show" do

    describe "response" do
      before do
        @product = Product.find(3)
        get :show, id: @product.id
      end

      it "returns a HTTP ok status" do
        expect(response).to have_http_status(:ok)
      end

      it "renders the show template" do
        expect(response).to render_template("show")
      end
    end

  end

end
