class ArticlePolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end
end
