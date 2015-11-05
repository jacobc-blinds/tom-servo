# Description:
#   Show a Shady Grouper meme image when someone mentions the grouper.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   grouper
#
# Author:
#   Greg Major

images = [
  "http://i.imgur.com/aabaZC3.jpg"
]

module.exports = (robot) ->
  robot.hear /grouper/i, (msg) ->
    msg.send msg.random images