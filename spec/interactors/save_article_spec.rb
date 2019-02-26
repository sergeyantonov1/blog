require "rails_helper"

describe SaveArticle do
  let(:interactor) { described_class.new(params: article_params, author: author) }
  let(:context) { interactor.context }

  let(:author) { create :user }

  describe "#call" do
    context "when valid params" do
      let(:article_params) { attributes_for(:article).merge(tag_titles: tag_titles) }
      let(:tag_titles) { "flatstack rails ruby" }

      it_behaves_like "success interactor"

      it "saves article" do
        expect { interactor.run }.to change { Article.count }
      end

      it "saves article tags" do
        expect { interactor.run }.to change { Tag.count }.by(3)
      end
    end

    context "when invalid params" do
      let(:article_params) { {} }

      it_behaves_like "failure interactor"

      it "does not save article" do
        expect { interactor.run }.not_to change { Article.count }
      end

      it "does not save article tags" do
        expect { interactor.run }.not_to change { Tag.count }
      end
    end
  end
end
