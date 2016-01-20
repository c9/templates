Welcome to Le Wagon Cloud9 environment!

To start the database, run:

```
sudo service postgresql start
```

To generate a new rails app:

```
cd ~/workspace
rails new -T --database=postgresql my-new-rails-app
cd my-new-rails-app
rake db:create
rails s -b $IP -p $PORT
```
