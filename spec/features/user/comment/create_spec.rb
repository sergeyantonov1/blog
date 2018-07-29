require "rails_helper"

feature "Create comment" do
  include_context "current user signed in"

  let!(:article) { create :article }
  let!(:user) { create :user }
  let(:attributes) { attributes_for(:comment).slice(:text) }

  before do
    visit article_path(article)
  end

  scenario "user creates comment with valid data" do
    fill_in :comment_text, with: attributes[:text]

    expect(page).to have_button "Create Comment"

    click_button "Create Comment"

    expect(page).to have_content(attributes[:text])
  end

  scenario "user creates comment with incalid data" do
    expect(page).to have_button "Create Comment"

    click_button "Create Comment"

    expect(page).to have_content("Comment could not be created")
  end
end
