require 'rails_helper'

RSpec.describe Order, :type => :model do
  it "creates an instance of order" do
    order = Order.new
    expect(order).to be_instance_of(Order)
  end

  describe "order validity" do
    it "create a valid order" do
      order = Order.new(customer_id: 3, product_id: 4, purchased: false)
      expect(order).to be_valid
    end
  end
end
