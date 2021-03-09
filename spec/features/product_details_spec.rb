require 'rails_helper'

RSpec.feature "users can navigate from home page to the product detail page by clicking on a product", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    2.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details once details is clicked" do

    visit root_path

    save_screenshot('test2a.png')

    click_on('Details', match: :first)
 
    expect(page).to have_text(/Quantity/i)
  
    save_screenshot('test2b.png')

  end

end
