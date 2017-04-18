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

    find(".product .btn-default", :match => :first).click
    # DEBUG / VERIFY
    puts page.html
    expect(page).to have_css '.products-detail'
  end
end
