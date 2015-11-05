# Description:
#   Show the Blame Thang meme image when someone blames Thang.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   blamethang
#
# Author:
#   Greg Major

images = [
  "http://www.worldofmunchkin.com/cardgame/img/deluxe.jpg",
  "http://www.worldofmunchkin.com/starmunchkin/",
  "http://www.worldofmunchkin.com/apocalypse/"
]

module.exports = (robot) ->
  robot.hear /munchkin/i, (msg) ->
    msg.send msg.random images
