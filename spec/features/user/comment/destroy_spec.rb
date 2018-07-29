require "rails_helper"

feature "User destroy comment" do
  include_context "current user signed in"

  let!(:article) { create :article }
  let!(:comment) { create :comment, article: article, user: current_user }
  let!(:another_article) { create :article, comments: [another_comment] }
  let(:another_comment) { create :comment }

  scenario "not his comment" do
    visit article_path(another_article)

    expect(page).not_to have_link("Destroy")
  end

  scenario "his comment" do
    visit article_path(article)

    expect(page).to have_link("Destroy")

    click_link "Destroy"

    expect(page).not_to have_content(comment.text)
  end
end
