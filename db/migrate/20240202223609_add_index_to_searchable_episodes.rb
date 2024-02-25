class AddIndexToSearchableEpisodes < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :episodes, :searchable, using: :gin, algorithm: :concurrently
  end
end
