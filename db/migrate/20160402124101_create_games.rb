class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :responder_name
      t.integer :creator_id
      t.string :url_key

      t.timestamps(null: false)
    end
  end
end
