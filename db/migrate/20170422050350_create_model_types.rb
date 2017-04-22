class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :model_type_slug, index:true, unique: true
      t.string :model_type_code
      t.integer :base_price
      t.references :model, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
