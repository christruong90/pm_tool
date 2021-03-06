class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :body
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
