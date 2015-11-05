# Description:
#   Show a game image when someone mentions a particular game.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   munchkin
#
# Author:
#   Will Killian

images = [
  "http://www.worldofmunchkin.com/cardgame/img/deluxe.jpg",
  "http://www.worldofmunchkin.com/starmunchkin/",
  "http://www.worldofmunchkin.com/apocalypse/"
]

module.exports = (robot) ->
  robot.hear /munchkin/i, (msg) ->
    msg.send msg.random images
