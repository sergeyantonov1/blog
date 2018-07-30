require "rails_helper"

feature "Update article" do
  include_context "current user signed in"

  let(:article) { create :article, user: current_user }
  let(:another_article) { create :article }
  let(:article_attributes) { attributes_for(:article).slice(:title, :text) }

  scenario "User updates his article" do
    visit edit_article_path(article)

    fill_form(:article, article_attributes)

    click_button "Update"

    expect(page).to have_content("Article was successfully updated.")
    expect(page).to have_content(article_attributes[:title])
    expect(page).to have_content(article_attributes[:text])
  end

  scenario "User updates not his article" do
    visit edit_article_path(another_article)

    expect(page).not_to have_button "Update Article"
  end
end
