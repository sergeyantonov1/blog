require "rails_helper"

describe Articles::FilteredQuery do
  subject { described_class.new(Article.all, params) }

  let!(:article_1) { create :article, title: "Title1", text: "Text1" }
  let!(:article_2) { create :article, title: "Title2", text: "Text2" }
  let!(:article_3) { create :article, title: "Title3", text: "Text3" }
  let!(:article_4) { create :article, title: "Title4", text: "Text4" }

  let(:params) { {} }
  let(:result) { subject.all }

  describe "#filter" do
    it "returns list of all articles" do
      expect(result).to match_array([article_1, article_2, article_3, article_4])
    end

    context "when filtering by title" do
      let(:params) { { query: "Title1" } }

      it "returns list of filtered articles" do
        expect(result).to match_array([article_1])
      end

      context "but there is no match" do
        let(:params) { { query: "Title5" } }

        it "returns an empty array" do
          expect(result).to be_empty
        end
      end
    end

    context "when filtering by text" do
      let(:params) { { query: "Text3" } }

      it "returns list of filtered articles" do
        expect(result).to match_array([article_3])
      end

      context "but there is no match" do
        let(:params) { { query: "Text0" } }

        it "returns an empty array" do
          expect(result).to be_empty
        end
      end
    end
  end
end
