# Description:
#   A variety of little bits of mischief.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Greg Major

module.exports = (robot) ->

  # Show the messed up goat when someone mentions a merge conflict
  robot.hear /merge\s?conflict/i, (msg) ->
    msg.send "http://i.imgur.com/9tNUCyH.gifv"
    msg.send "Oh snap! It's about to get real!"
    
  # Show Bruce Lee when someone volunteers to take a look
  robot.hear /\btake\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "Game on!"
    
  # Show Bruce Lee when someone volunteers to have a look
  robot.hear /\bhave\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "I wouldn't want to be on the other side of that 'look', pal!"
    
  # Show Bruce Lee when someone volunteers to look
  robot.hear /\bwill\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "Look? Yeah, it's about to get looked at REAL good!"
    
  # Show Bruce Lee when someone says they can fix something
  robot.hear /\bcan\b.+\bfix\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "Fix it? It's gonna wish it never existed in the first place!"
    
  # Show the Friday guy when someone mentions Friday
  robot.hear /friday/i, (msg) ->
    msg.send "TGIF!"
    msg.send "http://i.imgur.com/yrZwdD6.gifv"
  
  # Give 'em an emergency hug
  robot.hear /\bneed\b.+\bhug\b/igm, (msg) ->
    msg.send "http://i.imgur.com/cFId9Js.gifv"
  
  # Somebody found a bug!
  robot.hear /\bfound\b.+\bbug\b/igm, (msg) ->
    msg.send "http://i.imgur.com/7cyL3Mg.gifv"
  
  # Somebody invoked Wade's name
  robot.hear /wade/i, (msg) ->
    msg.send "http://i.imgur.com/zKIkl2a.gifv"
    msg.send "Seriously, do you guys make ANY decision without bothering Wade?"
    
  # Somebody tried to blame it on a race condition
  robot.hear /race\s?condition/i, (msg) ->
    msg.send "https://i.imgur.com/g74QhGM.jpg"
    
  # Somebody mentioned the grouper
  robot.hear /grouper/i, (msg) ->
    msg.send "http://i.imgur.com/aabaZC3.jpg"
    
  # Blame Thang!
  robot.hear /blame\s?thang/i, (msg) ->
    msg.send "https://i.imgur.com/HArwLsc.jpg"
    
  # Get a Zen message from GitHub
  robot.hear /\bzen\b/i, (msg) ->
    msg
      .http("https://api.github.com/zen")
      .get() (err, res, body) ->
        msg.send body
