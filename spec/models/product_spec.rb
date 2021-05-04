require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
    # validation tests/examples here
    it "Saves new product with all parameters" do
          @category = Category.new(name: "Footwear")
          @product = Product.new(name: "Sandal",quantity: 4, price: 65,category: @category)
          @product.valid?
          expect(@product.errors.full_messages).to eq([])
    end
end
end