class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :topic_name
      t.string :responder_name
      t.string :responder_relation
      t.integer :creator_id
      t.string :url_key

      t.timestamps(null: false)
    end
  end
end
