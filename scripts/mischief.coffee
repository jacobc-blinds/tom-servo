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

  # Person enters
  robot.enter (res) ->
    res.send "Is it too early to hate this guy?"

  # Person leaves
  robot.leave (res) ->
    res.send "Some cause happiness wherever they go; others, whenever they go."

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

  # SeaLab 2021 Energy!
  robot.hear /energy/i, (msg) ->
    msg.reply "I have the energy of a bear that has the energy of two bears!"

  # SeaLab 2021 Bad Idea!
  robot.hear /bad idea/i, (msg) ->
    msg.reply "Oh why don't you just shout down every idea I have? How about you call Bruce Springsteen and tell him to get another nickname since you're already the Boss! Huh? Yeah? Yeah!"
  
  # This coffee sucks!
  robot.hear /coffee/i, (msg) ->
    msg.reply "You know, our coffee tastes like it came out of an oil derrick. What'd you strain it through, a mummy?"

  # Have something to drink
  robot.hear /something to drink/i, (msg) ->
    msg.reply "Here, be sure to drink it all, sometimes the poison is on the bottom."

  # Drunk
  robot.hear /(\W|^)(drunk|cantina|beer|whiskey|vodka|booze)(\W|$)/i, (msg) ->
    msg.reply "I feel trembly, oh so shaky, I've had whiskey and vodka and gin."

  # Traffic
  robot.hear /traffic/i, (msg) ->
    msg.reply "Well, there's a lot of congestion on the highway, so you might want to consider an alternate route. Like, down the side of a steep mountain."

  # Trouble
  robot.hear /trouble/i, (msg) ->
    msg.reply "Why is the coat rack on fire?"

  # Plaid
  robot.hear /plaid/i, (msg) ->
    msg.reply "Two different kinds of plaid? Ew. I'm a naked robot and even *I* know that's a Fashion Don't."

  # Murder
  robot.hear /murder/i, (msg) ->
    msg.reply "Thank you very much for showing up. I'd like to welcome you all to our MURDER... MYSTERY... DINNER PARTY!"

  # Theory
  robot.hear /theory/i, (msg) ->
    msg.reply "The scientific theory I like best is that the rings of Saturn are composed entirely of lost airline luggage."
 
  # Offense
  robot.hear /offense/i, (msg) ->
    msg.reply "Humans are weird. Why do they say “no offense” right before they’re about to offend you?"
 
  # Skydive
  robot.hear /(\W|^)(skydive|skydiving|parachute)(\W|$)/i, (msg) ->
    msg.reply "If at first you don’t succeed... so much for skydiving."

  # Argument
  robot.hear /argument/i, (msg) ->
    msg.reply "Nothing sucks more than that moment during an argument when you realize you’re wrong."

  # Chicken
  robot.hear /(\W|^)(chicken|dream)(\W|$)/i, (msg) ->
    msg.reply "I dream of a better tomorrow, where chickens can cross the road and not be questioned about their motives."

  # Acceptance Criteria
  robot.hear /(\W|^)(ac|spec|specification|criteria)(\W|$)/i, (msg) ->
    msg.reply "I read acceptance criteria the same way I read science fiction. I get to the end and I think, 'Well, that’s not going to happen.'"

  # Running Late
  robot.hear /\b(\W|^)(be|running)\b.+\blate\b(\W|$)/igm, (msg) ->
    msg.reply "The trouble with being punctual is that nobody’s there to appreciate it."










