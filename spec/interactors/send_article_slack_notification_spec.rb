require "rails_helper"

describe SendArticleSlackNotification do
  let(:interactor) { described_class.new(author: author, article: article) }
  let(:context) { interactor.context }

  let(:author) { build(:user, full_name: "Jack Howard") }
  let(:article) { create(:article, user: author) }

  before do
    allow(SlackMessageJob).to receive(:perform_later)
  end

  it_behaves_like "success interactor"

  it "sends message to slack" do
    interactor.run
    
    expect(SlackMessageJob).to have_received(:perform_later)
  end
end
