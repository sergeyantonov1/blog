require "rails_helper"

describe SendArticleSlackNotification do
  let(:interactor) { described_class.new(author: author, article: article) }
  let(:context) { interactor.context }

  let(:author) { build(:user, full_name: "Jack Howard") }
  let(:article) { create(:article, user: author) }

  it_behaves_like "success interactor"

  it "sends message to slack" do
    expect(SlackMessageJob).to receive(:perform_later)

    interactor.run
  end
end
