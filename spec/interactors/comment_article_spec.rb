require "rails_helper"

describe CommentArticle do
  let(:interactor) { described_class.new(article: article, author: comment.user, comment: comment) }
  let(:context) { interactor.context }

  let(:article) { create :article }
  let(:comment) { build :comment, article: article }

  describe "#call" do
    it_behaves_like "success interactor"

    it "saves comment" do
      interactor.run

      expect { context }.to change { Comment.count }
      expect(context.comment.user).to eq comment.user
      expect(context.comment.article).to eq article
    end
  end
end
