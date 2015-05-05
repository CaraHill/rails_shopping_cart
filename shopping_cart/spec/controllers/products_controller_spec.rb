require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe "#index" do

    describe "response" do
      before { get :index }

      it "responds successfully with an HTTP 200 status code" do
        # get :index
        expect(response).to be_success
        expect(response). to have_http_status(200)
      end

      it "renders the index template" do
        # get :index
        expect(response).to render_template("index")
      end
    end

    it "assigns products to an instance variable" do
      Product.create(name: "robot", image: "image",price: 2000, description: "old robot")
      get :index
      expect(assigns(:products)).to eq(Product.all)
    end

  end

end
