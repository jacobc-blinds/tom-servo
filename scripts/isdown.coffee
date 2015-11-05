# Description:
#   Show the Is Down meme image when someone says that an environment is down.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Greg Major

images = [
  "https://i.imgur.com/YcmTj6j.gifv",
  "http://i.imgur.com/FAqJZdw.gifv",
  "http://i.imgur.com/RSg3ely.gifv"
]

module.exports = (robot) ->
  
  # Stage
  robot.hear /\bstage\b.+\bdown\b/igm, (msg) ->
    msg.send msg.random images

  # QA
  robot.hear /\bqa[0-9]\b.+\bdown\b/igm, (msg) ->
    msg.send msg.random images