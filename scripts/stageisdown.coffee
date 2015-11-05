# Description:
#   Show the Stage Is Down meme image when someone says that stage is down.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   stageisdown
#
# Author:
#   Greg Major

images = [
  "https://i.imgur.com/zCYuVDD.jpg"
]

module.exports = (robot) ->
  robot.hear /\bstage\b.+\bdown\b/igm, (msg) ->
    msg.send msg.random images