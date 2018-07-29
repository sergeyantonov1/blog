require "rails_helper"

feature "Update article" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article }

  let(:attributes) { attributes_for(:article).slice(:title, :text) }

  before do
    visit article_path(article)
  end

  def find_edit_article_link
    within ".article-actions" do
      expect(page).to have_link("Edit")
      click_link("Edit")
    end
  end

  context "when current user is article's author" do
    scenario "updates article with valid data" do
      find_edit_article_link

      fill_form(:article, attributes)

      click_button "Update Article"

      expect(page).to have_content(attributes[:title])
      expect(page).to have_content(attributes[:text])
    end

    scenario "updates article with invalid data" do
      find_edit_article_link

      fill_form(:article, title: "", text: "")

      click_button "Update Article"

      expect(page).to have_content("Article could not be updated")
    end
  end

  context "when current user is not article's owner" do
    scenario "not his article" do
      visit article_path(another_article)

      within ".article-actions" do
        expect(page).not_to have_link("Edit")
      end
    end
  end
end
