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

munchkinImages = [
  "http://www.worldofmunchkin.com/cardgame/img/deluxe.jpg",
  "http://www.worldofmunchkin.com/starmunchkin/img/cover_sm.jpg",
  "http://www.worldofmunchkin.com/apocalypse/img/cover_sm.jpg"
]

module.exports = (robot) ->
  robot.hear /munchkin/i, (msg) ->
    msg.send msg.random munchkinImages 


explodingKittenimages = [
  "http://i2.cdn.turner.com/cnnnext/dam/assets/150729170502-kittens-banner-exlarge-169.jpg",
  "http://cdn.hellogiggles.com/wp-content/uploads/2015/07/30/also.jpg",
  "https://cf.geekdo-images.com/images/pic2691976.png"
]

  robot.hear /exploding.*kitten/i, (msg) ->
    msg.send msg.random explodingKittenimages 
