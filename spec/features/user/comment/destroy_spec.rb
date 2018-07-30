require "rails_helper"

feature "Destroy comment" do
  include_context "current user signed in"

  let(:article) { create :article }
  let(:another_article) { create :article }
  let!(:comment) { create :comment, article: article, user: current_user }

  scenario "User destroy his comment" do
    visit article_path(article)

    click_link("Destroy")

    expect(page).not_to have_content(comment.text)
  end

  scenario "User destroys not his comment" do
    create :comment, article: another_article

    visit article_path(another_article)

    expect(page).to have_no_link("Destroy")
  end
end
