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
    it " Requires a product name" do
          @category = Category.new(name: "Footwear")
          @product = Product.new(quantity: 4, price: 65,category: @category)
          @product.valid?
          expect(@product.errors[:name]).not_to eq([])
    end
  it " Requires a product price" do
          @category = Category.new(name: "Footwear")
          @product = Product.new(name: "Sandal",quantity: 4, category: @category)
          @product.valid?
          expect(@product.errors[:price]).not_to eq([])
    end
  it " Requires a product category" do
          @category = Category.new(name: "Footwear")
          @product = Product.new(name: "Sandal",quantity: 4, price: 65)
          @product.valid?
          expect(@product.errors[:category]).not_to eq([])
    end
  it " Requires a product quantity" do
          @category = Category.new(name: "Footwear")
          @product = Product.new(name: "Sandal", price: 65,category: @category)
          @product.valid?
          expect(@product.errors[:quantity]).not_to eq([])
    end


end
end