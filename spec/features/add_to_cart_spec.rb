require 'rails_helper'

RSpec.feature "users can click an item to add to cart and the cart counter will increase by 1", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    2.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Cart counter update by 1 once the add button is clicked " do

    visit root_path

    save_screenshot('test3a.png')

    expect(page).to have_text('My Cart (0)')

    click_on('Add', match: :first)

    expect(page).to have_text('My Cart (1)')

    save_screenshot('test3b.png')

  end

end
