class ChangeBookmarksMovieidListid < ActiveRecord::Migration[7.1]
  def change
    change_table :bookmarks do |t|
      t.remove :movie_id, :list_id
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
    end
  end
end
