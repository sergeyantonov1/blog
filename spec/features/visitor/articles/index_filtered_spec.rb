require "rails_helper"

feature "Show filtered articles" do
  let(:query_params) { { query: "visible" } }

  before do
    create :article, title: "Title_1 visible"
    create :article, title: "Title_2 hidden"

    visit root_path(query_params)
  end

  scenario "Visitor sees all articles" do
    expect(page).to have_content("Title_1 visible")
    expect(page).to have_no_content("Title_2 hidden")
  end
end
