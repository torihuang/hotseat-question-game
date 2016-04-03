get '/games' do
  @premade_games = Game.all.to_a.find {|game| game.creator_id == -1}
  erb :'games/index'
end