require "rails_helper"

feature "Create article" do
  include_context "current user signed in"

  let(:article_attributes) { attributes_for(:article).slice(:title, :subtitle, :text) }

  before { visit articles_path }

  scenario "User creates article" do
    click_link "New publication"

    fill_form(:article, article_attributes)

    click_button "Create"

    expect(page).to have_content("Article was successfully created.")
    expect(page).to have_content(article_attributes[:title])
    expect(page).to have_content(article_attributes[:subtitle])
    expect(page).to have_content(article_attributes[:text])
  end
end
