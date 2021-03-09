require 'rails_helper'

RSpec.describe Product, type: :model do

  before do

    @category = Category.new(
      name: "Anything"
    )

    @product = Product.new(
      name: "Anything",
      price_cents: 1000,
      quantity: "Anything",
      category: @category
    )

  end

  describe 'Validations' do

    # it 'product to be valid with correct parameters' do
    #   product = Product.create()
    #   expect(product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank", "Name can't be blank", "Quantity can't be blank", "Category can't be blank"])
    # end

    # it 'is not valid without a name' do

    #   @product.name = nil
    #   @product.save
    #   expect(@product).to_not be_valid
    #   expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    # end
    # it 'is not valid without a price' do
    #   @product.price_cents = nil
    #   @product.save
    #   expect(@product).to_not be_valid
    #   expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    # end
    # it 'is not valid without a quantity' do
    #   @product.quantity = nil
    #   @product.save
    #   expect(@product).to_not be_valid
    #   expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    # end
    # it 'is not valid without a category' do
    #   @product.category = nil
    #   @product.save
    #   expect(@product).to_not be_valid
    #   expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    # end

  end
end
