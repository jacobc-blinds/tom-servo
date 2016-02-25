#
# Description:
#   AZAM!!!!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
#

module.exports = (robot) ->
	robot.hear /\!\!/i, (res) ->
		res.send("http://i.imgur.com/52Y31js.png");
  
