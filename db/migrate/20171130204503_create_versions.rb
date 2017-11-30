class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.references :package, foreign_key: true
      t.string :version, null: false
      t.date :published_at

      t.timestamps
    end
    add_index :versions, :version
  end
end
