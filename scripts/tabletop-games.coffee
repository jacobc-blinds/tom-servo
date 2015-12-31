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

explodingKittenimages = [
  "http://i2.cdn.turner.com/cnnnext/dam/assets/150729170502-kittens-banner-exlarge-169.jpg",
  "http://cdn.hellogiggles.com/wp-content/uploads/2015/07/30/also.jpg",
  "https://cf.geekdo-images.com/images/pic2691976.png"
]

kingOfTokyoImages = [
  "http://www.iellogames.com/images/KingOfTokyo_3Dbox.jpg"
]

welcomeToTheDungeonImages = [
    "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fi0.wp.com%2Fgeekdad.com%2Fwp-content%2Fuploads%2F2015%2F09%2FWelcomeToDungeon-cover.jpg&sp=ba29a32c835960f599cd17c99788d4f9",
    "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fgeekdad.com%2Fwp-content%2Fuploads%2F2015%2F09%2FWelcomeToDungeon-featured.jpg&sp=c09f006e1f53ed6e66ff987d4f4e54b8"
]

smashUpImages = [
    "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fhyggeonkel.dk%2Fstatic%2Fgrafik%2Fproduktbilleder%2Fsmash-up%2F01-smash-up-skraa.jpg&sp=ec0e0a05d72201c2915b2cc5ba0fbae7"
]

module.exports = (robot) ->
  robot.hear /munchkin/i, (msg) ->
    msg.send msg.random munchkinImages 

  robot.hear /exploding.*kitten/i, (msg) ->
    msg.send msg.random explodingKittenimages 

  robot.hear /king.*of.*tokyo/i, (msg) ->
    msg.send msg.random kingOfTokyoImages 

  robot.hear /welcome.*to.*the.*dungeon/i, (msg) ->
    msg.send msg.random welcomeToTheDungeonImages
  
  robot.hear /smash.*up/i, (msg) ->
    msg.send msg.random smashUpImages
