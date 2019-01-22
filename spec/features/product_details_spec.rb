require 'rails_helper'

RSpec.feature "Visitor navigators to product page", type: :feature, js: true do

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

  scenario "Visitor is directed to product root" do
    visit root_path

    first('article.product').click_link('Details')

    sleep 3

    expect(page).to have_content @product.description

    save_screenshot

  end

end


