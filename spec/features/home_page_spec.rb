require 'rails_helper'


## Note to self: feature block => describe block
## Note to self: scenario block => it block

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

before :each do
@category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end
  
  scenario "They see all products" do
    visit root_path


    # save_screenshot

    expect(page).to have_css 'article.product', count: 10
    
  end

end
