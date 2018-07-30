require "rails_helper"

feature "Destroy article" do
  include_context "current user signed in"

  let!(:article) do
    create :article,
      title: "First article title",
      subtitle: "First article subtitle",
      text: "First article text",
      user: current_user
  end

  let!(:another_article) do
    create :article,
      title: "Second article title",
      subtitle: "Second article subtitle",
      text: "Second article text"
  end

  scenario "User destroys his article" do
    visit article_path(article)

    click_on "Destroy"

    expect(page).to have_content "Article was successfully destroyed."
    expect(page).to have_no_content "First article title"
    expect(page).to have_no_content "First article subtitle"
    expect(page).to have_no_content "First article text"
  end

  scenario "User destroys not his article" do
    visit article_path(another_article)

    expect(page).to have_no_link("Delete")
  end
end
