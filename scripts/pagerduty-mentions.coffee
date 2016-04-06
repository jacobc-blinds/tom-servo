# Description:
#   Very basic utility to add an @channel mention whenever a PagerDuty notification is escalated.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Tim Coonfield

stringTable = require('string-table')

module.exports = (robot) ->

  # Respond with an @channel mention whenever an escalated incident is echoed to the screen from PagerDuty.
  robot.hear /Escalated: Incident\b/i, (msg) ->
    msg.send "@channel A ticket has been entered and not responded yet. If you are available, please take a look!"

    