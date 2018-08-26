class TagsController < ApplicationController
  respond_to :json

  def index
    respond_with tag_list
  end

  private

  def tag_list
    Tag.all_titles
  end
end
