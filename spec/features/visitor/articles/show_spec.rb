require "rails_helper"

feature "Show article" do
  let(:article) { create :article }

  before { visit article_path(article) }

  scenario "visitor sees article" do
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.subtitle)
    expect(page).to have_content(article.text)
  end
end
