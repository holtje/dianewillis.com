class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name,     null: false
      t.text :body,     null: false
      t.text :rendered, null: false

      t.timestamps
    end

    add_index :pages, [:name], unique: true
  end
end
