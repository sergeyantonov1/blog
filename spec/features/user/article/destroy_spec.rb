require "rails_helper"

feature "Destroy article" do
  include_context "current user signed in"

  let!(:article) { create :article, title: "First article title", text: "First article text", user: current_user }
  let!(:another_article) { create :article, title: "Second article title", text: "Second article text" }

  scenario "User destroys his article" do
    visit article_path(article)

    click_on "Destroy"

    expect(page).to have_content "Article was successfully destroyed."
    expect(page).not_to have_content "First article title"
    expect(page).not_to have_content "First article text"
  end

  scenario "User destroys not his article" do
    visit article_path(another_article)

    expect(page).not_to have_link("Delete")
  end
end
