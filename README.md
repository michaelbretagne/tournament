# Tournament

This application was created as my submission for Project 4 of Udacity's Full Stack NanoDegree program.

##Project Overview:

Develop a database schema to store the game matches between players.<br>
Write a Python module to rank the players and pair them up in matches in a tournament.

##Project Description: Tournament:

In this project, I wrote a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.

##Code Templates:

The template file **tournament.sql** is where I put the database schema, in the form of SQL create table commands.

The template file **tournament.py** is where I put the code of my module.

The file **tournament_test.py** contains unit tests that will test the functions I’ve written in tournament.py.

##Prerequisites:

**Git:** https://git-scm.com/downloads<br>
**Virtual Box:** https://www.virtualbox.org/wiki/Downloads<br> 
**Vagrant:** https://www.vagrantup.com/downloads.html

##Installation Steps:

In your favorite terminal:<br>

1. Run: git clone http://github.com/udacity/fullstack-nanodegree-vm fullstack<br> *This will create a new directory named fullstack*<br>
2. Move to the vagrant folder by entering: cd fullstack/vagrant/<br>
3. Using Git, clone this project: git clone https://github.com/michaelbretagne/tournament.git tournament<br>
*This will create a directory inside the vagrant directory named tournament*<br>
4. Run Vagrant by entering: vagrant up<br>
5. Log into Vagrant VM by entering: vagrant ssh<br>
6. Move to tournament directory by entering: cd /vagrant/tournament/<br>
7. Launches the psql command line interface by entering: psql
8. Create the tournament database by entering: \i tournament.sql<br>
*This will create the psql database, tables and views*<br>
9. Quit the psql command line interface by entering: \q<br>
10. Test the program by entering: python tournament_test.py

##Expected Outcome

Success! All tests pass! vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py<br>
1. Old matches can be deleted.<br>
2. Player records can be deleted.<br>
3. After deleting, countPlayers() returns zero.<br>
4. After registering a player, countPlayers() returns 1.<br>
5. Players can be registered and deleted.<br>
6. Newly registered players appear in the standings with no matches.<br>
7. After a match, players have updated standings.<br>
8. After one match, players with one win are paired. Success! All tests pass!

##Extra Credit

If there is an odd number of players, assign one player a “bye” (skipped round). A bye counts as a free win. A player should not receive more than one bye in a tournament.
