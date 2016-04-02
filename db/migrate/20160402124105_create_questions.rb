class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :query
      t.string :answer
      t.integer :game_id

      t.timestamps(null: false)
    end
  end
end
