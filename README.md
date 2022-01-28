Social Network tool attempt study.

Regarding DB:
- we use one Polymorphic table (favorites). Reminder regarding the way to create a favorite:
    1- create users :
        us1 = User.create(email: "a@xxx", password: "secret")
        us2 = User.create(email: "b@xxx", password: "secret")
    2- create a theme :
        th = Theme.create(title: "Second on the planet", content: "here it is" )
    3- create favorites :
        fav1 = Favorite.create(user_id: us1.id, favoritable: th)
        fav2 = Favorite.create(user_id: us1.id, favoritable: us2)
    4- recall favorites :
        Favorite.all
        us1.
