#Social Network tool attempt study.


##DB MODELS :

The polymorphic table 'favorites' was created using :
 - rails g model favorite user:references details favoritable:references{polymorphic}
 - User & Theme models we've added :
     -  has_many :favorites

Regarding DB:
- we use one Polymorphic table (favorites). Reminder regarding the way to create a favorite:
    1- create users :
    ```bash
        us1 = User.create(email: "a@xxx", password: "secret")
        us2 = User.create(email: "b@xxx", password: "secret")
    ```
    2- create a theme :
    ```bash
        th = Theme.create(title: "Second on the planet", content: "here it is" )
    ```
    3- create favorites :
    ```bash
        fav1 = Favorite.create(user_id: us1.id, favoritable: th)
        fav2 = Favorite.create(user_id: us1.id, favoritable: us2)
    ```
    4- recall favorites :
    ```bash
        Favorite.all
        us1.favorites (in 'rails c', it's necessary to exit and reenter to have changes takin in account)
    ```
