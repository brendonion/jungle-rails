require 'rails_helper'

RSpec.feature "User adds an product to cart", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "User clicks Add to Cart" do
    
    visit root_path

    find(".actions .btn-primary", :match => :first).click

    cart = find(".nav:last-child")

    expect(cart).to have_content("My Cart (1)")

  end
end
