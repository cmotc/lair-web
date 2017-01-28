LAIR! Development Blog
======================

Nervously Enabling AI Controls
------------------------------

####by:idk

###Sat Jan 28 16:17:15 EST 2017

Well it's about time I actually start getting used to this development blog.
Today I'm going to get the beginnings of the Mobile Non-Player Entities going,
and by that I mean I'm going to make their behavior scriptable. I'm trying to
plan the whole thing very carefully, because LAIR is supposed to be a minimal
resource organizer that outputs a game. Ideally, I'd like to register as few
functions with Lua as possible and limit the amount of information available to
any given Mob. For now, I'm just going to make them all run into the nearest
northward wall, though. Once that's done, I'm going to make a new screencap to
put on the homepage.

Remaining Features to Implement:

  * AI Scripts(in progress)
  * Network(Will be using Tox for networking, no servers, also because Tox is
  cool.)
  * Game Balance, Cheating Definition/Prevention(basically, when you join
  someone else's server, that server makes a copy of you, then it kills your
  clone as slowly as possible. This process makes it possible to deduce all the
  stats without relying on the player to report them accurately. Getting to know
  new players, Sun-Tzu Style. Then all new players are required to meet within
  a standard deviation(or something like this, so to speak) of the Player
  Generation Script used by the player running the Server.)
  * Player Generation(Basically, a player supplies parameters to a script which
  tells the map what kind of character they want to play. This lets you create
  characters on a per-scenario basis, or players can use their own player
  generation scripts.)
  * GUI Launcher(A GUI should be created which should be allowed to select the
  same parameters as the CLI Parameters in an appealing, self-explanatory way.

LAIR! a procedural dungeon crawler
----------------------------------

####by:idk

###Fri Jan 20 17:02:49 EST 2017

Hello Blog!
