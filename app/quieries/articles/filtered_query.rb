module Articles
  class FilteredQuery < BaseQuery
    DEFAULT_ARTICLES_ON_PAGE = 10

    FILTER_OPTIONS = %i[author query per].freeze

    def all
      FILTER_OPTIONS.reduce(relation) do |result, key|
        if params[key].blank?
          result
        else
          send "apply_#{key}", relation
        end
      end
    end

    private

    def apply_author(relation)
      relation.where(user_id: params[:author])
    end

    def apply_query(relation)
      relation.search_by_title_or_text(params[:query])
    end
  end
end
