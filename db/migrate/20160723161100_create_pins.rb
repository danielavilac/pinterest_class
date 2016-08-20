class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.text :description
      t.string :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
