require 'rails_helper'

RSpec.feature "Visitor navigates to home page and clicks on add to cart button", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'
    @product = @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
    end
  
  scenario "Visitor is able to click on add to cart button" do
    visit root_path

    first('article.product').click_button('Add')

    save_screenshot

    expect(find('nav')).to have_text 'My Cart (1)'

  end

end
