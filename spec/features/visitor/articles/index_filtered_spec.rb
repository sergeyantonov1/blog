require "rails_helper"

feature "Show filtered articles" do
  let!(:article_1) { create :article, title: "Title_1" }
  let!(:article_2) { create :article, title: "Title_2" }
  let(:query_params) { { query: "_1" } }

  before { visit root_path(query_params) }

  scenario "Visitor sees all articles" do
    expect(page).to have_content("Title_1")
    expect(page).to have_no_content("Title_2")
  end
end
