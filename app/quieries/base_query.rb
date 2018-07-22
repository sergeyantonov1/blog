class BaseQuery
  attr_reader :relation, :params

  def initialize(relation, params = {})
    @relation = relation
    @params = params
  end

  def all
  end
end
