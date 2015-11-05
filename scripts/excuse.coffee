# Description:
#   Get a random developer excuse.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot developer excuse me - Get a random developer excuse
#   hubot developer excuse - Get a random developer excuse
#   hubot excuse - Get a random developer excuse
#
# Author:
#   Greg Major

module.exports = (robot) ->
  robot.respond /(?:developer excuse|excuse)(?: me)?/i, (msg) ->
    robot.http("http://developerexcuses.com")
      .get() (err, res, body) ->
        matches = body.match /<a [^>]+>(.+)<\/a>/i

        if matches and matches[1]
          msg.send matches[1]
