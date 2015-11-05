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
  "https://i.imgur.com/HArwLsc.jpg"
]

module.exports = (robot) ->
  robot.hear /blame\s?thang/i, (msg) ->
    msg.send msg.random images