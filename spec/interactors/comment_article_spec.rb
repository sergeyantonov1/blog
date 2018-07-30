require "rails_helper"

describe CommentArticle do
  subject(:result) { described_class.call(article: article, author: comment.user, comment: comment) }

  let(:article) { create :article }
  let(:comment) { build :comment, article: article }

  describe "#call" do
    it "saves comment" do
      expect { result }.to change(Comment, :count).by 1
      expect(result.comment.user).to eq comment.user
      expect(result.comment.article).to eq article
    end
  end
end
