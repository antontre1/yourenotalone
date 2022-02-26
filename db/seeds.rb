# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# Clean the DBs
Article.destroy_all
Comment.destroy_all
Favorite.destroy_all
Theme.destroy_all
Vote.destroy_all
User.destroy_all
State.destroy_all


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

  puts "States created"
# Create 10 users

user_params =
[
  {
    url: 'https://images.unsplash.com/photo-1627484641213-1fa23ed245af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    email: 'pauldurand@gmail.com',
    password: '123456',
    username: 'Paul Durand',
    state: State.all.sample,
    biography: 'Jeune étudiant en droit, fan de tennis et de littérature'
  },
  {
    url: 'https://images.unsplash.com/photo-1605993439219-9d09d2020fa5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
    email: 'elisawindsor@gmail.com',
    password: '123456',
    username: 'Elisa Windsor',
    state: State.all.sample,
    biography: '“La vertu est le courage du bien.”'
  },
  {
    url: 'https://images.unsplash.com/photo-1618780179533-870736eaea58?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    email: 'emmaho@gmail.com',
    password: '123456',
    username: 'Emma Ho',
    state: State.all.sample,
    biography: '“La résilience: art de naviguer dans les torrents.” Boris Cyrulnik'
  },
  {
    url: 'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    email: 'corinnemichel@gmail.com',
    password: '123456',
    username: 'Corinne Michel',
    state: State.all.sample,
    biography: 'Fière maman de 3 chats: Ronron, Chouchou et Garfield'
  },
  {
    url: 'https://images.unsplash.com/photo-1598550880863-4e8aa3d0edb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OHxZTk91b1gtU0gxQXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
    email: 'jeannejohn@gmail.com',
    password: '123456',
    username: 'Jeanne John',
    state: State.all.sample,
    biography: 'Jeune Entrepreneuse, travailleuse acharnée'
  },
  {
    url: 'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    email: 'celinedurand@gmail.com',
    password: '123456',
    username: 'Celine Durand',
    state: State.all.sample,
    biography: 'Mes parents étaient fans de Céline Dion'
  },
  {
    url: 'https://images.unsplash.com/photo-1508474722893-c3ccb8918d39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80',
    email: 'claraboulleau@gmail.com',
    password: '123456',
    username: 'Clara Boulleau',
    state: State.all.sample,
    biography: 'Photographe et peintre'
  },
  {
    url: 'https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
    email: 'rosepeuplier@gmail.com',
    password: '123456',
    username: 'Rose Peuplier',
    state: State.all.sample,
    biography: 'Fan de mécanique, toujours les mains dans le cambouis'
  }
]

user_params.each do |params|
  new_user = User.new(email: params[:email],
                      password: params[:password],
                      username: params[:username],
                      state: params[:state],
                      biography: params[:biography])
  file = URI.open(params[:url])
  new_user.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_user.save!
end
puts "Users created"

# Create 4 theme
  # theme_1 = Theme.new(title: "Vie avec conjoint", description: "Tout pour parler de l'impact du lupus sur la vie avec son conjoint")
  # theme_1.save
  # theme_2 = Theme.new(title: "Etudes scientifiques", description: "Des études de fond sur le sujet pour mieux comprendre la maladie")
  # theme_2.save
  # theme_3 = Theme.new(title: "Blagues", description: "Pour rire et parler avec humour du quotidien")
  # theme_3.save


    theme_1 = Theme.new(title: "Découverte du Lupus", description: "Toutes les questions que peuvent se poser ceux et celles qui découvrent le Lupus")
      file = URI.open('https://images.unsplash.com/photo-1596510743279-b354a760e5d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80')
      theme_1.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      theme_1.save

    article_1 = Article.new(title: "Comment reconnaitre une poussée de Lupus ?", content: 'Toutes les questions que peuvent se poser ceux et celles qui découvrent le Lupus', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1618311522704-b4ac7f811c5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
    article_1.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_1.theme = theme_1
    puts 'toto'
    puts article_1.user
    puts article_1.title
    article_1.save!
    article_2 = Article.new(title: "Quels sont les douleurs du Lupus ? ", content: 'Toutes les questions que peuvent se poser ceux et celles qui découvrent le Lupus', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1586017680700-5f480e54a3a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    article_2.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_2.theme = theme_1
    article_2.save!
    article_3 = Article.new(title: "Quelles sont les causes du Lupus", content: 'Toutes les questions que peuvent se poser ceux et celles qui découvrent le Lupus', user_id: User.all.sample.id)
        file = URI.open('https://images.unsplash.com/photo-1516027828283-84217f09f3c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80')
    article_3.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_3.theme = theme_1
    article_3.save!

  theme_2 = Theme.new(title: "Alimentation", description: "Posts relatifs à l'alimentation et comment se nourrir avec le Lupus")
    file = URI.open('https://images.unsplash.com/photo-1546548970-71785318a17b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    theme_2.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    theme_2.save
  article_1 = Article.new(title: "Conseil d'alimentation", content: 'Les personnes atteintes de lupus présentent un risque accru de maladie cardiovasculaire.

C’est pourquoi une alimentation bonne pour le coeur est particulièrement importante. S’inspirer du régime alimentaire méditerranéenne est idéal.

- Beaucoup de légumes, de fruits, de grains entiers et de noix.
- Modérez votre consommation de viande. Préférez les viandes maigres et la volaille.
- Essayez de manger du poisson deux fois par semaine et privilégiez les poissons gras (riches en oméga-3).
- Consommez aussi peu de sel que possible.
', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1546548970-71785318a17b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    article_1.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_1.theme = theme_2
    article_1.save!
    article_2 = Article.new(title: "Comment gérer la perte de poids liée au Lupus ? ", content: 'Il est fréquent que le lupus fasse perdre l appétit, sachant aussi que les ulcères buccaux ne sont pas rares. Il est néanmoins important de manger suffisamment pour maintenir un poids de forme. Si vos médicaments provoquent des maux d’estomac, fractionnez les repas, mangez chaque fois des petites quantités d’aliments faciles à digérer et évitez les plats trop épicés ou acides. Les conseils d’un diététicien seront utiles.', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1617807482294-cc43d29c5ac4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    article_2.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_2.theme = theme_2
    article_2.save!
    article_3 = Article.new(title: "Comment gérer les prises de poids liée au Lupus ?", content: 'Les stéroïdes, habituellement prescrit dans ce cas, peuvent faire grossir. Pour compenser, évitez les boissons alcoolisées, limitez les sucreries et veillez à faire suffisamment d’exercice pour maintenir votre poids de forme. Les enfants doivent faire particulièrement attention aux excès.', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1522844990619-4951c40f7eda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
    article_3.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_3.theme = theme_2
    article_3.save!
    article_4 = Article.new(title: "Quels sont les aliments à éviter?", content: 'En principe, vous pouvez manger de tout. Il y a cependant deux produits que vous devriez éviter.

- L’ail. Certaines substances continues dans l’ail peuvent stimuler l’activité immunitaire et provoquer des poussées de lupus. Il n’y a cependant pas de consensus scientifique à ce sujet.
- La luzerne et les germes de haricots mungo (souvent appelés erronément pousses ou germes de soja), qui pourraient provoquer des poussées de lupus.', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
    article_4.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_4.theme = theme_2
    article_4.save!
    article_5 = Article.new(title: "L’ail : Très mauvaise idée donc évitez ! ", content: 'J’ai été mangé chez ma Grand-Mère il y a 2 jours, et j’ai tout de suite senti après le repas que je faisais une poussée. J’avais déjà eu la même réaction 2 fois par le passé. Et j’ai tout de suite fat la connexion : les 3 plats contenaient de l’ail.
      Je sais que l’ail peut relever vos plats les plus fades, mais évitez pour votre propre bien.', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1579705744772-f26014b5e084?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    article_5.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_5.theme = theme_2
    article_5.save!
  theme_3 = Theme.new(title: "Ma peau et le Lupus", description: "Comment gérer ma peau avec un Lupus cutané")
    file = URI.open('https://images.unsplash.com/photo-1597826322461-9b11d306d08f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2574&q=80')
    theme_3.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    theme_3.save
  theme_4 = Theme.new(title: "Vie de Couple", description: "Comment concilier vie de couple et Lupus")
    file = URI.open('https://images.unsplash.com/photo-1511405889574-b01de1da5441?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
    theme_4.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    theme_4.save
    article_1 = Article.new(title: "Comment j'ai annoncé à mon conjoint que je souffre de Lupus", content: 'Je souffre du Lupus depuis près de 4 ans et je n’avais jamais vraiment vécu une relation depuis que j’ai été diagnostiquée.
      Là j’ai rencontré un homme bien il y a maintenant 3 mois et je veux que ça dure. Je sentais que je ne pourrais pas lui cacher plus longtemps ma pathologie, j’ai donc préféré lui annoncer de mon plein gré plutôt qu’il l’apprenne suite à une hospitalisation.
      J’ai pris mon courage à 2 mains et je lui ai annoncé… Il a été extrêmement compréhensif et m’a déclaré que son amour pour moi était plus fort que le Lupus !
      Je suis tellement heureuse !!!!', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1543932927-a9def13a0e7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    article_1.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_1.theme = theme_4
    article_1.save!
  Theme5 = Theme.new(title: "Lupus Masculin", description: "Le Lupus chez les hommes")
  file = URI.open('https://images.unsplash.com/photo-1440133197387-5a6020d5ace2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
  Theme5.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  Theme5.save
  Theme6 = Theme.new(title: "Lupus et les Reins", description: "Comment vivre un Lupus à atteinte Rénale")
  file = URI.open('https://images.unsplash.com/photo-1610363776668-76acbd134a6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80')
  Theme6.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  Theme6.save
    article_1 = Article.new(title: "Quels sont les symptômes d'un Lupus à atteinte Rénale?", content: 'Elle est présente chez 30 à 40% des patients. Elle consiste en une inflammation des glomérules du rein (glomérulonéphrite). Le glomérule est la partie du rein contenant le filtre qui nettoie le sang. Différentes formes d’atteintes sont possibles, des formes non graves sans aucune conséquence aux formes graves pouvant évoluer vers la destruction plus ou moins rapide du rein (une insuffisance rénale). L’atteinte rénale doit toujours être recherchée car elle n’est pas ressentie par le patient alors qu’un diagnostic précoce permet d’améliorer fortement les chances de guérison. L’inflammation élargit les mailles du filtre et un peu de sang passe dans les urines. Cette présence de sang se détecte à l’examen des urines par une bandelette urinaire dont les résultats sont obtenus en une minute, mais pour des résultats plus précis, une analyse des urines au laboratoire doit être demandée. Seront recherchées dans les urines : la présence de protéines d’origine sanguine (protéinurie), la présence de globules rouges (hématurie) ou de globules blancs d’origine sanguine (leucocyturie). La présence d’une protéinurie ou d’une hématurie justifie une ponction-biopsie rénale pour préciser le degré d’inflammation du glomérule ce qui conditionnera la prise en charge thérapeutique qui va de la simple surveillance à un traitement par fortes doses de corticoïdes et d’immunosuppresseurs.', user_id: User.all.sample.id)
    file = URI.open('https://images.unsplash.com/photo-1618914241652-ff0a094b5a86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
    article_1.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    article_1.theme = Theme6
    article_1.save!
  Theme7 = Theme.new(title: "La grossesse et le Lupus", description: "Quels sont les implications du Lupus sur la grossesse? ")
  file = URI.open('https://images.unsplash.com/photo-1544784179-ae1535e9f013?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=799&q=80')
  Theme7.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  Theme7.save
  Theme8 = Theme.new(title: "Les traitements", description: "Les traitements contre le Lupus")
  file = URI.open('https://images.unsplash.com/photo-1585435557343-3b092031a831?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
  Theme8.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  Theme8.save

puts "articles created"



# Create 10 comments

10.times {
  new_comment = Comment.new(content: Faker::Hipster.words(number: 4),
                      article: Article.all.sample,
                      user: User.all.sample)
  new_comment.save
}
puts "comments created"

# Create 2 votes per user

users = User.all
users.each do |user|
  new_vote = Vote.new(reaction: 1,
                      article: Article.all.sample,
                      user: user)
  new_vote.save
end

puts "votes created"
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

puts "favorites created"
puts "Ajouter les reindex pour Elastic Search"
Theme.reindex
User.reindex
Article.reindex
puts "ok seed done"
