10.times do
  User.create(username: Faker::Superhero.power, email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, profile_pic: Faker::Avatar.image, password: "password")
end

20.times do
  Game.create(title: Faker::Book.title, topic_name: Faker::Book.genre, responder_name: Faker::Name.name, creator: User.all.to_a.sample)
end

200.times do
  Question.create(query: Faker::Hipster.sentence, answer: Faker::Hipster.sentence, game: Game.all.to_a.sample)
end