require "rails_helper"

feature "Create comment" do
  include_context "current user signed in"

  let(:article) { create :article }
  let(:comment_attributes) { attributes_for(:comment).slice(:text) }

  before do
    visit article_path(article)
  end

  scenario "User creates comment" do
    fill_form(:comment, comment_attributes)

    click_button "Create Comment"

    expect(page).to have_content(comment_attributes[:text])
  end
end
