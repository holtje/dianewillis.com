class AddTitleToPages < ActiveRecord::Migration
  def up
    rename_column :pages, :name, :title
    add_column    :pages, :key, :string, length: 32
    execute "UPDATE pages SET key = title;"
    change_column :pages, :key, :string, null: false
    add_index     :pages, :key
  end

  def down
    rename_column :pages, :title, :name
    remove_index  :pages, :key
    remove_column :pages, :key
  end
end
