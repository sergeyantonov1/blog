class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title, null: false
    end

    add_index :tags, :title, unique: true
  end
end
