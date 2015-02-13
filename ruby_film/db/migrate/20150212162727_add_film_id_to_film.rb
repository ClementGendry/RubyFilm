class AddFilmIdToFilm < ActiveRecord::Migration
  def change
    add_column :films, :film_id, :integer
  end
end
