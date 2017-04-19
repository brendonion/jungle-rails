require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do
  
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

  scenario "They see the product detail page" do
    # ACT
    visit root_path

    first(".product .btn-default").click
    # DEBUG / VERIFY
    expect(page).to have_css '.product-detail'
  end
end
