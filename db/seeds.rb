# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clean the DBs
# User.destroy_all
# Article.destroy_all
# Comment.destroy_all
# Favorite.destroy_all
# State.destroy_all
# Theme.destroy_all
# Vote.destroy_all

require "open-uri"
# config locales for Faker (mainly for addresses in fact)
Faker::Config.locale = 'fr'

# Create 4 states
  State0 = State.new(emotional_state: 0)
  State1 = State.new(emotional_state: 1)
  State2 = State.new(emotional_state: 2)
  State3 = State.new(emotional_state: 3)
  State0.save
  State1.save
  State2.save
  State3.save

# Create 10 users
10.times {
  new_user = User.new(email: Faker::Internet.email,
                      password: '123456',
                      username: Faker::Name.name,
                      state: State.all.sample)
  new_user.save
}

# Create 4 theme
  Theme1 = Theme.new(title: "Vie avec conjoint", description: "Tout pour parler de l'impact du lupus sur la vie avec son conjoint")
  Theme1.save
  Theme2 = Theme.new(title: "Etudes scientifiques", description: "Des études de fond sur le sujet pour mieux comprendre la maladie")
  Theme2.save
  Theme3 = Theme.new(title: "Blagues", description: "Pour rire et parler avec humour du quotidien")
  Theme3.save


# Create 3 articles
10.times {
  new_article = Article.new(title: Faker::Book.title,
                      description: Faker::GreekPhilosophers.quote,
                      content: Faker::Lorem.words(number:100),
                      user: User.all.sample,
                      theme: Theme.all.sample)
  new_article.save
}

# Create 10 comments

10.times {
  new_comment = Comment.new(content: Faker::Hipster.words(number: 4),
                      article: Article.all.sample,
                      user: User.all.sample)
  new_comment.save
}

# Create 2 votes per user

users = User.all
users.each do |user|
  new_vote = Vote.new(reaction: 1,
                      article: Article.all.sample,
                      user: user)
  new_vote.save
end
# Create 1 favorite per users

users = User.all
users.each do |user|
  new_favorite_theme = Favorite.new(user: user, favoritable: Theme.all.sample)
  new_favorite_theme.save
  new_favorite_user = Favorite.new(user: user, favoritable: User.all.sample)
  new_favorite_user.save
  new_favorite_article = Favorite.new(user: user, favoritable: Article.all.sample)
  new_favorite_article.save
end

puts "ok seed done"
