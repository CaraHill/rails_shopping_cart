require 'rails_helper'

RSpec.describe Product, :type => :model do
  it "creates an instance product" do
    product = Product.new
    expect(product).to be_instance_of(Product)
  end

  describe "product validity" do
    it "check if a product is invalid" do
      product = Product.new
      expect(product).not_to be_valid
    end

    it "create a valid product" do
      product = Product.new(name: "Shoe", description: "One shoe.", image: "image", price: 500)
      expect(product).to be_valid
    end
  end

end
