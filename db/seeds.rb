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
  State0 = State.new(emotional_state: 0, text: "Pas très en forme")
  State1 = State.new(emotional_state: 1, text: "De bonne humeur")
  State2 = State.new(emotional_state: 2, text: "En pleine rémission")
  State3 = State.new(emotional_state: 3, text: "Heureux")
  State0.save
  State1.save
  State2.save
  State3.save

# Create 10 users
i = 0
10.times {
  i = i + 1
  new_user = User.new(email: "monmail#{i}@a.com",
                      password: '123456',
                      username: Faker::Name.name,
                      state: State.all.sample)
  new_user.save
}

# Create 4 theme
  # Theme1 = Theme.new(title: "Vie avec conjoint", description: "Tout pour parler de l'impact du lupus sur la vie avec son conjoint")
  # Theme1.save
  # Theme2 = Theme.new(title: "Etudes scientifiques", description: "Des études de fond sur le sujet pour mieux comprendre la maladie")
  # Theme2.save
  # Theme3 = Theme.new(title: "Blagues", description: "Pour rire et parler avec humour du quotidien")
  # Theme3.save

    Theme1 = Theme.new(title: "Découverte du Lupus", description: "Toutes les questions que peuvent se poser ceux et celles qui découvrent le Lupus")
  Theme1.save

    Article1 = Article.new(title: "Comment reconnaitre une poussée de Lupus ?", content: '', author: "")
    Article1.theme = Theme1
    Article1.save!
    Article2 = Article.new(title: "Quels sont les douleurs du Lupus ? ", content: '', author: "")
    Article2.theme = Theme1
    Article2.save!
    Article3 = Article.new(title: "Quelles sont les causes du Lupus", content: '', author: "")
    Article3.theme = Theme1
    Article3.save!

  Theme2 = Theme.new(title: "Alimentation", description: "Posts relatifs à l'alimentation et comment se nourrir avec le Lupus")
  Theme2.save
      Article1 = Article.new(title: "Conseil d'alimentation", content: 'Les personnes atteintes de lupus présentent un risque accru de maladie cardiovasculaire.

C’est pourquoi une alimentation bonne pour le coeur est particulièrement importante. S’inspirer du régime alimentaire méditerranéenne est idéal.

- Beaucoup de légumes, de fruits, de grains entiers et de noix.
- Modérez votre consommation de viande (rouge). Préférez les viandes maigres et la volaille.
- Essayez de manger du poisson deux fois par semaine et privilégiez les poissons gras (riches en oméga-3).
- Consommez aussi peu de sel que possible.
', author: "")
    Article1.theme = Theme2
    Article1.save!
    Article2 = Article.new(title: "Comment gérer la perte de poids liée au Lupus ? ", content: 'Il est fréquent que le lupus fasse perdre l appétit, sachant aussi que les ulcères buccaux ne sont pas rares. Il est néanmoins important de manger suffisamment pour maintenir un poids de forme. Si vos médicaments provoquent des maux d’estomac, fractionnez les repas, mangez chaque fois des petites quantités d’aliments faciles à digérer et évitez les plats trop épicés ou acides. Les conseils d’un diététicien seront utiles.', author: "")
    Article2.theme = Theme2
    Article2.save!
    Article3 = Article.new(title: "Comment gérer les prises de poids liée au Lupus ?", content: 'Les stéroïdes, habituellement prescrit dans ce cas, peuvent faire grossir. Pour compenser, évitez les boissons alcoolisées, limitez les sucreries et veillez à faire suffisamment d’exercice pour maintenir votre poids de forme. Les enfants doivent faire particulièrement attention aux excès.', author: "")
    Article3.theme = Theme2
    Article3.save!
    Article4 = Article.new(title: "Quels sont les aliments à éviter?", content: 'En principe, vous pouvez manger de tout. Il y a cependant deux produits que vous devriez éviter.

- L’ail. Certaines substances continues dans l’ail peuvent stimuler l’activité immunitaire et provoquer des poussées de lupus. Il n’y a cependant pas de consensus scientifique à ce sujet.
- La luzerne et les germes de haricots mungo (souvent appelés erronément pousses ou germes de soja), qui pourraient provoquer des poussées de lupus.', author: "")
    Article4.theme = Theme2
    Article4.save!
    Article5 = Article.new(title: "L’ail : Très mauvaise idée donc évitez ! ", content: 'J’ai été mangé chez ma Grand-Mère il y a 2 jours, et j’ai tout de suite senti après le repas que je faisais une poussée. J’avais déjà eu la même réaction 2 fois par le passé. Et j’ai tout de suite fat la connexion : les 3 plats contenaient de l’ail.
      Je sais que l’ail peut relever vos plats les plus fades, mais évitez pour votre propre bien.', author: "")
    Article5.theme = Theme2
    Article5.save!
  Theme3 = Theme.new(title: "Ma peau et le Lupus", description: "Comment gérer ma peau avec un Lupus cutané")
  Theme3.save
  Theme4 = Theme.new(title: "Vie de Couple", description: "Comment concilier vie de couple et Lupus")
  Theme4.save
    Article1 = Article.new(title: "Comment j'ai annoncé à mon conjoint que je souffre de Lupus", content: 'Je souffre du Lupus depuis près de 4 ans et je n’avais jamais vraiment vécu une relation depuis que j’ai été diagnostiquée.
      Là j’ai rencontré un homme bien il y a maintenant 3 mois et je veux que ça dure. Je sentais que je ne pourrais pas lui cacher plus longtemps ma pathologie, j’ai donc préféré lui annoncer de mon plein gré plutôt qu’il l’apprenne suite à une hospitalisation.
      J’ai pris mon courage à 2 mains et je lui ai annoncé… Il a été extrêmement compréhensif et m’a déclaré que son amour pour moi était plus fort que le Lupus !
      Je suis tellement heureuse !!!!', author: "")
    Article1.theme = Theme4
    Article1.save!
  Theme5 = Theme.new(title: "Lupus Masculin", description: "Le Lupus chez les hommes")
  Theme5.save
  Theme6 = Theme.new(title: "Lupus et les Reins", description: "Comment vivre un Lupus à atteinte Rénale")
  Theme6.save
    Article1 = Article.new(title: "Quels sont les symptômes d'un Lupus à atteinte Rénale?", content: 'Elle est présente chez 30 à 40% des patients. Elle consiste en une inflammation des glomérules du rein (glomérulonéphrite). Le glomérule est la partie du rein contenant le filtre qui nettoie le sang. Différentes formes d’atteintes sont possibles, des formes non graves sans aucune conséquence aux formes graves pouvant évoluer vers la destruction plus ou moins rapide du rein (une insuffisance rénale). L’atteinte rénale doit toujours être recherchée car elle n’est pas ressentie par le patient alors qu’un diagnostic précoce permet d’améliorer fortement les chances de guérison. L’inflammation élargit les mailles du filtre et un peu de sang passe dans les urines. Cette présence de sang se détecte à l’examen des urines par une bandelette urinaire dont les résultats sont obtenus en une minute, mais pour des résultats plus précis, une analyse des urines au laboratoire doit être demandée. Seront recherchées dans les urines : la présence de protéines d’origine sanguine (protéinurie), la présence de globules rouges (hématurie) ou de globules blancs d’origine sanguine (leucocyturie). La présence d’une protéinurie ou d’une hématurie justifie une ponction-biopsie rénale pour préciser le degré d’inflammation du glomérule ce qui conditionnera la prise en charge thérapeutique qui va de la simple surveillance à un traitement par fortes doses de corticoïdes et d’immunosuppresseurs.', author: "")
    Article1.theme = Theme6
    Article1.save!
  Theme7 = Theme.new(title: "La grossesse et le Lupus", description: "Quels sont les implications du Lupus sur la grossesse? ")
  Theme7.save
  Theme8 = Theme.new(title: "Les traitements", description: "Les traitements contre le Lupus")
  Theme8.save



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

theme

puts "ok seed done"
