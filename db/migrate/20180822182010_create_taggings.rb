class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :article, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false
    end
  end
end
