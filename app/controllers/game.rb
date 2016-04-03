get '/games' do
  @premade_games = Game.all.to_a.select {|game| game.creator_id == -1}
  erb :'games/index'
end

get '/games/new' do
  premade_game = Game.find_by(id: params[:premade_game_id])

  if premade_game
    @questions = premade_game.questions
  end
  erb :'games/new'
end

post '/games' do
  game = Game.new(title: params[:title], creator: current_user)

  if game.save
    params.each do |key, value|
      next if key == 'title'
      next if key == 'new-game-submit'
      next if value == ''
      Question.create(query: value, game: game)
    end
    redirect "/games/#{game.id}"
  else
    erb :'404'
  end
end

get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  if @game
    erb :'games/show'
  else
    erb :'404'
  end
end

get '/games/:id/edit' do
  @game = Game.find_by(id: params[:id])
  if @game && current_user.id == @game.creator_id
    @questions = @game.questions
    erb :'games/edit'
  else
    erb :'404'
  end
end

delete '/games/:id' do
  game = Game.find_by(id: params[:id])
  if game && current_user.id == game.creator_id
    game.destroy
    redirect '/'
  else
    erb :'404'
  end
end

put '/games/:id' do
  game = Game.find_by(id: params[:id])

  if game
    game.update(title: params[:title]) unless params[:title] == ''
    game.questions.each {|question| question.destroy}

    # puts params.to_h
    puts "HEREHEREHEREHERE"
    params.each do |key, value|
      next if value == ''
      next if key.split('_')[0] != 'question'
      Question.create(query: value, game: game)
    end

    redirect "/games/#{game.id}"
  else
    erb :'404'
  end
end