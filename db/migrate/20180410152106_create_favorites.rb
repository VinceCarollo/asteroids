class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.string :neo_reference_id
      t.string :name
      t.boolean :is_potentially_hazardous_asteroid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
