class AddSubtitleToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :subtitle, :string, null: false, default: ""
  end
end
