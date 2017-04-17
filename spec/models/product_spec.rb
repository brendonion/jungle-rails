require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is a fully validated product' do
      @category = Category.create(name: 'Food')
      @product = Product.new(
        name: 'Subway',
        description: 'A subway sandwich.',
        image: 'https://i.vimeocdn.com/portrait/58832_300x300',
        price_cents: 3000,
        quantity: 3,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end
    it 'has a name' do
      @category = Category.create(name: 'Food')
      @product = Product.new(
        name: nil,
        description: 'A subway sandwich.',
        image: 'https://i.vimeocdn.com/portrait/58832_300x300',
        price_cents: 3000,
        quantity: 3,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end
    it 'has a price' do
      @category = Category.create(name: 'Food')
      @product = Product.new(
        name: 'Subway',
        description: 'A subway sandwich.',
        image: 'https://i.vimeocdn.com/portrait/58832_300x300',
        price_cents: nil,
        quantity: 3,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end
    it 'has a quantity' do
      @category = Category.create(name: 'Food')
      @product = Product.new(
        name: 'Subway',
        description: 'A subway sandwich.',
        image: 'https://i.vimeocdn.com/portrait/58832_300x300',
        price_cents: 3000,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end
    it 'has a category' do
      @category = Category.create(name: 'Food')
      @product = Product.new(
        name: 'Subway',
        description: 'A subway sandwich.',
        image: 'https://i.vimeocdn.com/portrait/58832_300x300',
        price_cents: 3000,
        quantity: 3,
        category_id: nil
      )
      expect(@product).to_not be_valid
    end
  end
end
