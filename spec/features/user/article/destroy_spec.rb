require "rails_helper"

feature "Destroy article" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article }

  let(:attributes) { attributes_for(:article).slice(:title, :text) }

  before do
    visit article_path(article)
  end

  def find_destroy_article_link
    within ".article-actions" do
      expect(page).to have_link("Destroy")
      click_link("Destroy")
    end
  end

  context "when current user is article's author" do
    scenario "deletes article" do
      find_destroy_article_link

      expect(page).to have_content ("Article was successfully destroyed")
    end
  end

  context "when current user is not article's owner" do
    scenario "not his article" do
      visit article_path(another_article)

      within ".article-actions" do
        expect(page).not_to have_link("Destroy")
      end
    end
  end
end
