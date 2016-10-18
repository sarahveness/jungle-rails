require 'rails_helper'

RSpec.feature "Visitor adds to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "When user clicks on 'Add to Cart', cart increases by 1" do

  visit root_path

  page.find('.product').find_link('Add').click

  save_screenshot

  expect(page).to have_text 'My Cart (1)'

end
end