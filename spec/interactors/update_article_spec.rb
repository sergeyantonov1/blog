require "rails_helper"

describe UpdateArticle do
  let(:interactor) { described_class.new(article: article, params: article_params) }
  let(:context) { interactor.context }
  let(:context_article) { context.article }
  let(:article) { create :article }

  describe "#call" do
    context "when valid params" do
      let(:tags) { "flatstack" }

      let(:article_params) do
        {
          title: "New title",
          subtitle: "New subtitle",
          text: "New text",
          tags: tags
        }
      end

      it_behaves_like "success interactor"

      it "updates article" do
        interactor.run

        expect(context_article.title).to eq("New title")
        expect(context_article.subtitle).to eq("New subtitle")
        expect(context_article.text).to eq("New text")
      end

      it "updates article tags" do
        interactor.run

        expect(context_article.tags.count).to eq(1)
        expect(context_article.tags[0].title).to eq("flatstack")
      end
    end

    context "when invalid params" do
      let(:article_params) { { title: "", subtitle: "", text: "" } }

      it_behaves_like "failure interactor"

      it "does not update article" do
        interactor.run

        article.reload

        expect(context_article.title).not_to eq("")
        expect(context_article.subtitle).not_to eq("")
        expect(context_article.text).not_to eq("")
      end
    end
  end
end
