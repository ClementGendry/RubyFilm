class AddWatchListToLink < ActiveRecord::Migration
  def change
    add_column :links, :watch_list, :boolean
  end
end
