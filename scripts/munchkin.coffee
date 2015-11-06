# Description:
#   Show a game image when someone mentions a particular game.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Will Killian

images = [
  "http://www.worldofmunchkin.com/cardgame/img/deluxe.jpg",
  "http://www.worldofmunchkin.com/starmunchkin/img/cover_sm.jpg",
  "http://www.worldofmunchkin.com/apocalypse/img/cover_sm.jpg"
]

module.exports = (robot) ->
  robot.hear /munchkin/i, (msg) ->
    msg.send msg.random images
