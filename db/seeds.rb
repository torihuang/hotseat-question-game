10.times do
  User.create(username: Faker::Superhero.power, email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_pic: Faker::Avatar.image, password: "password")
end

20.times do
  Game.create(title: Faker::Book.title, responder_name: Faker::Name.name, creator: User.all.to_a.sample)
end

200.times do
  Question.create(query: Faker::Hipster.sentence, answer: Faker::Hipster.sentence, game: Game.all.to_a.sample)
end

family_game_night = Game.create(title: "Family Game Night", creator_id: -1)
bachelorette_party = Game.create(title: "Bachelorette Party", creator_id: -1)
bachelor_party = Game.create(title: "Bachelor Party", creator_id: -1)

Question.create(query: "Where did you first meet?", game: bachelorette_party)
Question.create(query: "What do you love most about her?", game: bachelorette_party)
Question.create(query: "She looks most sexy in...", game: bachelorette_party)
Question.create(query: "Where is the most ridiculous place you two have hooked up?", game: bachelorette_party)
Question.create(query: "What is her favorite pet name for you?", game: bachelorette_party)


Question.create(query: "Where did you first meet?", game: bachelor_party)
Question.create(query: "What does she love most about you?", game: bachelor_party)
Question.create(query: "He looks most sexy in...", game: bachelor_party)
Question.create(query: "Where is the most ridiculous place you two have hooked up?", game: bachelor_party)
Question.create(query: "What is her favorite pet name for you?" , game: bachelor_party)

Question.create(query: "Who drinks the most wine?", game: family_game_night)
Question.create(query: "Who is most likely to get their way?", game: family_game_night)
Question.create(query: "What is your favorite family road trip?", game: family_game_night)
Question.create(query: "Who is most likely to win at arm wrestling?", game: family_game_night)
Question.create(query: "What is the craziest family christmas?", game: family_game_night)