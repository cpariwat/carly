class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :model_slug, index: true, unique: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
