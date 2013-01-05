# one interesting fact

A simple little game.

## Design

 * /
   * Signup, Gameplay
 * /login
   * sign in w/ email
 * /game
   * start new game
   * status of all current games
 * /game/:id
   * if new game
     * invite players
   * else if chooser
     * status of submitters
     * time left
     * once everyone has submitted or time up Make a choice 
   * else
     * status of submitters (1 of x has submitted)
     * submit your post
 * /user/:name
   * win stats
   * games played stats
   * "I've played games with"

## Features

MVP

 * timeouts
 * groups
 * login
 * rotate chooser

Future

 * facebook
 * chat room
 * iphone
 * android

## Links

 * [Travis][]: [![Build Status](https://secure.travis-ci.org/icco/oneinterestingfact.png?branch=master)][travis]
 * [Gemnasium][]: [![Dependency Status](https://gemnasium.com/icco/oneinterestingfact.png?travis)][gemnasium]
 * [Code Climate][]: [![Code Climate](https://codeclimate.com/badge.png)][code climate]

[travis]: http://travis-ci.org/#!/icco/basic
[gemnasium]: https://gemnasium.com/icco/basic
[code climate]: https://codeclimate.com/github/icco/basic
