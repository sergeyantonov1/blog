require "rails_helper"

describe ArticlesController do
  let!(:user) { create :user }
  let(:article_from_db) { Article.last }

  before { sign_in(user) }

  describe "POST #create" do
    let(:article_params) do
      {
        article: {
          title: "New article",
          text: "Article's text"
        }
      }
    end

    it "saves new article" do
      expect { post :create, params: article_params }
        .to change(Article, :count).by 1

      expect(article_from_db.title).to eq "New article"
      expect(article_from_db.text).to eq "Article's text"
    end
  end

  describe "PATCH #update" do
    let(:article) { create :article, user: user }
    let(:article_params) do
      {
        title: "New title",
        text: "Updated text"
      }
    end

    let(:params) { { id: article.id, article: article_params } }

    it "updates article" do
      patch :update, params: params

      expect(article_from_db.title).to eq "New title"
      expect(article_from_db.text).to eq "Updated text"
    end
  end

  describe "DELETE #destroy" do
    let!(:article) { create :article, user: user }
    let(:params) { { id: article.id } }

    it "deletes article" do
      expect { delete :destroy, params: params }
        .to change(Article, :count).by(-1)
    end
  end
end
