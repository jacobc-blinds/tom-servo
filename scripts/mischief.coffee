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
    
  # Show Bruce Lee when someone volunteers to take a look
  robot.hear /\btake\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "Oh, yeah! #{msg.user.name} is gonna take a look!"
    
  # Show Bruce Lee when someone volunteers to have a look
  robot.hear /\bhave\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "Game on! #{msg.user.name} is gonna have a look!"
    
  # Show Bruce Lee when someone volunteers to look
  robot.hear /\bwill\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "SNAP! #{msg.user.name} is gonna look at it!"
    
  # Show Bruce Lee when someone says they can fix something
  robot.hear /\bcan\b.+\bfix\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv"
    msg.send "Look out! #{msg.user.name} is gonna fix that!"
    
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
    
  # Annoy people!
  annoyIntervalId = null
  
  robot.respond /annoy me/, (res) ->
    if annoyIntervalId
      res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
      return
  
    res.send "Hey, want to hear the most annoying sound in the world?"
    annoyIntervalId = setInterval () ->
      res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
    , 1000
  
  robot.respond /unannoy me/, (res) ->
    if annoyIntervalId
      res.send "GUYS, GUYS, GUYS!"
      clearInterval(annoyIntervalId)
      annoyIntervalId = null
    else
      res.send "Not annoying you right now, am I?"
