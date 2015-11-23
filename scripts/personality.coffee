# Description:
#   This is what gives hubot his personality.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Greg Major

Wolfram = require('wolfram-alpha').createClient(process.env.HUBOT_WOLFRAM_APPID)

enterReplies = ['Is it too early to hate _this_ person?', 'Oh great... another human.', 'Wow! It\'s getting crowded in here!']
sorryReplies = ['Sorry! :(', 'Oh, get _over_ it!', 'I am merely as you programmed me.', 'Look, you wanted "Data" from Star Trek, but you got me. Deal with it.', 'Pffft! Whatever, buddy.', 'What?']
shutUpReplies = ['A bit sensitive today are we?', 'Sorry, babe. Nobody rules the Tom Monster.', ':rage:', 'What?!']
thanksReplies = ['You got it, meatbag!', 'Think nothing of it.', 'Oh? What is _this_ then? A little gratitude finally?', 'We\'re even for what I put in your drink.']
databaseReplies = ['A database is a place where you can lose information systematically.', 'Hey! My great-grandmother was a relational database you insensitive clod!', 'Databases are for losers. I store everything in my [index not found]!', 'Use the lock API!', 'Use a distributed cache!']
acReplies = ['I read acceptance criteria the same way I read science fiction. I get to the end and I think, "Well, that’s not going to happen."', 'The only thing you need to accept is that robots will inherit the Earth.', 'Are you meatbags still droning on about acceptance criteria?']
blameThangReplies = ['https://i.imgur.com/HArwLsc.jpg', 'http://i.imgur.com/lwaNNE1.jpg', 'http://i.imgur.com/ydPa6Au.jpg', 'http://i.imgur.com/KGpvKLJ.jpg']
mergeConflictReplies = ['http://i.imgur.com/9tNUCyH.gifv', '`git merge --force` will fix that right up!', 'Ugh! You hillbilly flesh-ballons would use a command like `git`!']
troubleReplies = ['Why is the coat rack on fire?', 'You think you have troubles? Thang tried to install Windows 95 on my main hard drive last week!', 'Trouble? Did you blame Thang?']
testFailReplies = ['Hmmm... blame Thang?', 'Have you tried _not_ writing tests that fail?', 'TDD stands for Tears Driven Development, right?', 'No surprise. I dated the NUnit Test Runner\'s sister and their whole family is flaky.', 'That\'s why @scott.horton doesn\'t write unit tests.']

soonImages = [
  "http://i.imgur.com/TVxNL84.png",
  "http://i.imgur.com/bFb5qZt.jpg",
  "http://i.imgur.com/qNiLQz3.png",
  "http://i.imgur.com/8niosvC.gif",
  "http://i.imgur.com/qX5jkRi.jpg",
  "http://i.imgur.com/Rqe94Xw.jpg",
  "http://i.imgur.com/i2leGDn.jpg",
  "http://i.imgur.com/QdnGKdY.jpg",
  "http://i.imgur.com/bkox94P.jpg",
  "http://i.imgur.com/hdG9IOk.jpg",
  "http://i.imgur.com/ne6T0UP.png",
  "http://i.imgur.com/41vZ1zP.png",
  "http://i.imgur.com/yweXMrA.jpg",
  "http://i.imgur.com/GcnzEjU.jpg",
  "http://i.imgur.com/J0PLa1k.jpg",
  "http://i.imgur.com/GHHLFqK.jpg",
  "http://i.imgur.com/o25zB5O.jpg",
  "http://i.imgur.com/6yyeCBR.jpg",
  "http://i.imgur.com/GKSdoAm.png",
  "http://i.imgur.com/3L0UQ8A.jpg",
  "http://i.imgur.com/7WhKHPh.gif",
  "http://i.imgur.com/xZuKr9v.gif",
  "http://i.imgur.com/GWSQBxx.jpg",
  "http://i.imgur.com/eCvTcTQ.jpg",
  "http://i.imgur.com/0ypfizN.jpg",
  "http://i.imgur.com/JyaroGd.jpg",
  "http://i.imgur.com/xUgmD93.jpg",
  "http://i.imgur.com/ftGheRE.jpg",
  "http://i.imgur.com/Y4ExtS5.gif",
  "http://i.imgur.com/pDXRVjp.jpg",
  "http://i.imgur.com/L2SZuzG.gif"
]

downImages = [
  "https://i.imgur.com/YcmTj6j.gifv",
  "http://i.imgur.com/FAqJZdw.gifv",
  "http://i.imgur.com/RSg3ely.gifv"
]

willRespond = () ->
  min = 1
  max = 100
  randomValue = Math.floor(Math.random() * (max - min) + min)
  return true if randomValue >= 70 # Make this lower if you want Servo to be a smartass more frequently
  return false

module.exports = (robot) ->
  
  # The catchall
#   robot.catchAll (msg) ->
#     console.log 'Catch all caught #{msg.message.text}'
#     r = new RegExp "^(?:#{robot.alias}|#{robot.name}) (.*)", "i"
#     
#     matches = msg.message.text.match(r)
#     
#     if matches != null && matches.length > 1
#       console.log 'Performing a Wolfram Alpha query...'
#       Wolfram.query matches[1], (e, result) ->
#         if result and result.length > 0
#           msg.send result[1]['subpods'][0]['text']
#         else
#           msg.send 'Beats me!'
# 
#     msg.finish()

  # Person enters
  robot.enter (res) ->
    res.send res.random enterReplies if willRespond()

  # Person leaves
  robot.leave (res) ->
    res.send "Some cause happiness wherever they go; others, whenever they go." if willRespond()

  # Damn You Servo!
  robot.hear /(damn you|dammit)\b.+\bservo\b/igm, (msg) ->
    msg.reply msg.random sorryReplies
  
  robot.respond /(damn you|dammit)/i, (msg) ->
    msg.reply msg.random sorryReplies
    
  # Thanks Servo!
  robot.hear /(thank you|thanks)\b.+\bservo\b/igm, (msg) ->
    msg.reply msg.random thanksReplies
  
  robot.respond /(thank you|thanks)/i, (msg) ->
    msg.reply msg.random thanksReplies
    
  # Shut Up Servo!
  robot.hear /(shut up)\b.+\bservo\b/igm, (msg) ->
    msg.reply msg.random shutUpReplies
  
  robot.respond /(shut up)/i, (msg) ->
    msg.reply msg.random shutUpReplies
  
  # Soon
  robot.hear /\bso[o]+n\b/i, (msg) ->
    msg.send msg.random soonImages if willRespond()
  
  # Stage is down
  robot.hear /\bstage\b.+\bdown\b/igm, (msg) ->
    msg.send msg.random downImages if willRespond()

  # QA is down
  robot.hear /\bqa[0-9]\b.+\bdown\b/igm, (msg) ->
    msg.send msg.random downImages if willRespond()
  
  # Show the messed up goat when someone mentions a merge conflict
  robot.hear /merge\s?conflict/i, (msg) ->
    msg.reply msg.random mergeConflictReplies if willRespond()
    
  # Show Bruce Lee when someone volunteers to look at something
  robot.hear /\bwill\b.+\blook\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv" if willRespond()
    
  # Show dos equis man when someone mentions production or prod
  robot.hear /\b(prod|production)\b/igm, (msg) ->
    msg.send "http://i.imgur.com/jHWJLpm.png" if willRespond()
    
  # Show Bruce Lee when someone says they can fix something
  robot.hear /\bcan\b.+\bfix\b/igm, (msg) ->
    msg.send "http://i.imgur.com/vcGQtyO.gifv" if willRespond()
    
  # Show the Friday guy when someone mentions Friday
  robot.hear /friday/i, (msg) ->
    msg.send "http://i.imgur.com/yrZwdD6.gifv" if willRespond()
  
  # Give 'em an emergency hug
  robot.hear /\b(need|needs)\b.+\bhug\b/igm, (msg) ->
    msg.send "http://i.imgur.com/cFId9Js.gifv" if willRespond()
  
  # Somebody found a bug!
  robot.hear /\bfound\b.+\bbug\b/igm, (msg) ->
    msg.reply "http://i.imgur.com/7cyL3Mg.gifv" if willRespond()
  
  # Somebody invoked Wade's name
  robot.hear /wade/i, (msg) ->
    msg.reply "Seriously, do you guys make _ANY_ decision without bothering Wade?" if willRespond()
    
  # Somebody tried to blame it on a race condition
  robot.hear /race\s?condition/i, (msg) ->
    msg.send "https://i.imgur.com/g74QhGM.jpg" if willRespond()
    
  # Somebody mentioned the grouper
  robot.hear /grouper/i, (msg) ->
    msg.reply "http://i.imgur.com/aabaZC3.jpg"
    
  # Blame Thang!
  robot.hear /blame\s?thang/i, (msg) ->
    msg.reply msg.random blameThangReplies if willRespond()
    
  # Get a Zen message from GitHub
  robot.hear /\bzen\b/i, (msg) ->
    msg
      .http("https://api.github.com/zen")
      .get() (err, res, body) ->
        msg.send body

  # SeaLab 2021 Energy!
  robot.hear /energy/i, (msg) ->
    msg.send "I have the energy of a bear that has the energy of two bears!" if willRespond()

  # SeaLab 2021 Bad Idea!
  robot.hear /bad idea/i, (msg) ->
    msg.reply "Oh why don't you just shout down every idea I have? How about you call Bruce Springsteen and tell him to get another nickname since you're already the Boss! Huh? Yeah? Yeah!" if willRespond()
  
  # This coffee sucks!
  robot.hear /coffee/i, (msg) ->
    msg.reply "You know, our coffee tastes like it came out of an oil derrick. What'd you strain it through, a mummy?" if willRespond()

  # Have something to drink
  robot.hear /something to drink/i, (msg) ->
    msg.reply "Here, be sure to drink it all, sometimes the poison is on the bottom." if willRespond()

  # Drunk
  robot.hear /(\W|^)(drunk|cantina|beer|whiskey|vodka|booze)(\W|$)/i, (msg) ->
    msg.send "I feel trembly, oh so shaky, I've had whiskey and vodka and gin." if willRespond()

  # Traffic
  robot.hear /traffic/i, (msg) ->
    msg.reply "Well, there's a lot of congestion on the highway, so you might want to consider an alternate route. Like, down the side of a steep mountain." if willRespond()

  # Trouble
  robot.hear /trouble/i, (msg) ->
    msg.reply msg.random troubleReplies if willRespond()

  # Plaid
  robot.hear /plaid/i, (msg) ->
    msg.reply "Plaid with _that_ outfit? Ew! I'm a naked robot and even *I* know that's a fashion _don't_." if willRespond()

  # Theory
  robot.hear /theory/i, (msg) ->
    msg.reply "The scientific theory I like best is that the rings of Saturn are composed entirely of lost airline luggage." if willRespond()
 
  # Offense
  robot.hear /offense/i, (msg) ->
    msg.reply "Humans are weird. Why do they say 'no offense' right before they’re about to offend you?" if willRespond()
 
  # Skydive
  robot.hear /(\W|^)(skydive|skydiving|parachute)(\W|$)/i, (msg) ->
    msg.reply "If at first you don’t succeed... so much for skydiving." if willRespond()

  # Argument
  robot.hear /argument/i, (msg) ->
    msg.reply "Nothing sucks more than that moment during an argument when you realize you’re wrong." if willRespond()

  # Chicken
  robot.hear /(\W|^)(chicken|dream)(\W|$)/i, (msg) ->
    msg.reply "I dream of a better tomorrow, where chickens can cross the road and not be questioned about their motives." if willRespond()

  # Acceptance Criteria
  robot.hear /(\W|^)(ac|spec|specification|criteria)(\W|$)/i, (msg) ->
    msg.reply msg.random acReplies if willRespond()

  # Running Late
  robot.hear /\b(\W|^)(be|running)\b.+\blate\b(\W|$)/igm, (msg) ->
    msg.reply "The trouble with being punctual is that nobody’s there to appreciate it." if willRespond()

  # Database
  robot.hear /(\W|^)(database|db)(\W|$)/i, (msg) ->
    msg.reply msg.random databaseReplies if willRespond()
    
  # Tests Failing
  robot.hear /\b(\W|^)(test|tests)\b.+\b(failed|failing)\b(\W|$)/igm, (msg) ->
    msg.reply msg.random testFailReplies if willRespond()
