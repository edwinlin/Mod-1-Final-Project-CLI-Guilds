# Module One Final Project
- Description - 
Welcome to Fight Club
In this game played through the Command Line Interface, you can register a User who can then create characters that can create, join, and leave guild associations, as well as fight other characters. 

Your actions have a lasting effect. When you leave or join a guild, that guild will adjust its membership registry. If a guild no longer has any members, it will lose its guild association status and be removed from the Guild Registry. If you happen to hurt another character badly enough (HP less than or equal to Zero), that character will be removed from the game, and all associations will be notified and updated.

To play, you must create a User. The characters created by a User will be saved by the game and can only be used by that particular Sser. To select a User, all you have to do is type its name correctly. There is no list of Users displayed, so you'll have to remember the Username you created if you want to use its characters.

- Installation - 
Download the zip file here:
https://github.com/edwinlin/Mod-1-Final-Project-CLI-Guilds/archive/master.zip
OR
Clone the repo here:
https://github.com/edwinlin/Mod-1-Final-Project-CLI-Guilds.git
Once the copy is on your machine and you are in base directory, run these three commands:
1) bundle install
2) rake db:migrate
3) ruby bin/run.rb

These commands will install required gems, create the database(s), and start the application.

- Notes - 
These were the user stories we had in mind when making this game:
 : Retrieve characters from database
 : Supply a name to create a character with random stats
 : Deleting and creating a character persists in the database
 : Can use characters to battle and join guild

# Deliverables

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.
5. Practice Paired Programming and Github Collaboration Best-Practices

Contributors:
Edwin Lin - github.com/edwinlin

Raymond Chow - github.com/rchowdev
