class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.string :title
      t.string :description

      t.timestamps
    end

    create_table :authors do |t|
      t.string :name
      t.string :email, index: true
    end

    create_table :maintainers do |t|
      t.string :name
      t.string :email, index: true
    end

    create_table :package_authors do |t|
      t.references :package, index: true
      t.references :author, index: true
    end

    create_table :package_maintainers do |t|
      t.references :package, index: true
      t.references :maintainer, index: true
    end

    add_index :packages, :name
    add_index :packages, :title
  end
end
