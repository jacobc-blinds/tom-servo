# Description:
#   Show the appropriate meme image when someone says 'race condition'.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   race condition
#
# Author:
#   Greg Major

images = [
  "https://i.imgur.com/g74QhGM.jpg"
]

module.exports = (robot) ->
  robot.hear /race\s?condition/i, (msg) ->
    msg.send msg.random images
