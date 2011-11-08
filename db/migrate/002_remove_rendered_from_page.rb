class RemoveRenderedFromPage < ActiveRecord::Migration
  def up
    execute <<-SQL
      UPDATE pages
         SET body = rendered
    SQL
    remove_column :pages, :rendered
  end

  def down
    raise "Can't roll this back, sorry."
  end
end
