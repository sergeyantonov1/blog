require "rails_helper"

feature "Create article" do
  include_context "current user signed in"

  let(:attributes) { attributes_for(:article).slice(:title, :text) }

  before { visit articles_path }

  scenario "User creates article with valid data" do
    click_link "New publication"

    fill_form(:article, attributes)

    click_button "Create Article"

    expect(page).to have_content(attributes[:title])
    expect(page).to have_content(attributes[:text])
  end

  scenario "User creates article with invalid data" do
    click_link "New publication"

    click_button "Create Article"

    expect(page).to have_content("Article could not be created")
  end
end
