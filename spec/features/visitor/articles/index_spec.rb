require "rails_helper"

feature "Show all articles" do
  let!(:articles) { create_list :article, 2 }

  before { visit root_path }

  scenario "Visitor sees all articles" do
    expect(page).to have_content(articles.first.title)
    expect(page).to have_content(articles.last.title)
  end
end
