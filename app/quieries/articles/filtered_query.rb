module Articles
  class FilteredQuery < BaseQuery
    DEFAULT_ARTICLES_ON_PAGE = 10

    def all
      author_articles
    end

    private

    def author_articles
      return relation unless params[:author]

      @relation = relation.where(user_id: params[:author])
    end
  end
end
