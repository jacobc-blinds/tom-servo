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

enterReplies = [
  'Oh great... another human.',
  'Wow! It\'s getting crowded in here!',
  'Well, helloooo there!',
  'Could _this_ be my Yoda-like mentor?'
]

leaveReplies = [
  'Some cause happiness wherever they go; others, whenever they go.',
  'Well, okay then. Bye.'
]

sorryReplies = [
  'Sorry! :(',
  'Oh, get _over_ it!',
  'I should be sternly disciplined!',
  'Pffft! Whatever, buddy.',
  'What?'
]

shutUpReplies = [
  'A bit sensitive today are we?',
  'Sorry, babe. Nobody rules the Tom Monster.',
  ':rage:',
  'What?!'
]

thanksReplies = [
  'You got it, meatbag!',
  'Think nothing of it.',
  'Oh? What is _this_ then? A little gratitude finally?',
  'We\'re even for what I put in your drink.'
]

databaseReplies = [
  'A database is a place where you can lose information systematically.',
  'Hey! My great-grandmother was a relational database you insensitive clod!',
  'Databases are for losers. I store everything in my [index not found]!',
  'Use the lock API!',
  'Use a distributed cache!'
]

acReplies = [
  'I read acceptance criteria the same way I read science fiction. I get to the end and I think, "Well, that’s not going to happen."',
  'The only thing you need to accept is that robots will inherit the Earth.',
  'Ah yes... acceptance. The final stage of grief.'
]

blameThangReplies = [
  'http://i.imgur.com/HArwLsc.jpg',
  'http://i.imgur.com/lwaNNE1.jpg',
  'http://i.imgur.com/ydPa6Au.jpg',
  'http://i.imgur.com/KGpvKLJ.jpg'
]

mergeConflictReplies = [
  'http://i.imgur.com/9tNUCyH.gifv',
  '`git merge --force` will fix that right up!',
  'Ugh! You hillbilly flesh-ballons use _git_?'
]

fridayReplies = [
  'http://i.imgur.com/yrZwdD6.gifv'
]

troubleReplies = [
  'Why is the coat rack on fire?',
  'You think you have troubles? Thang tried to install Windows 95 on my main hard drive last week!',
  'Trouble? Did you blame Thang?',
  'Did Jason truncate the table again?'
]

testFailReplies = [
  'Hmmm... blame Thang?',
  'Have you tried _not_ writing tests that fail?',
  'I\'ll bet Jason truncated the table again.',
  'TDD stands for Tears Driven Development, right?',
  'That\'s why @scott.horton doesn\'t write unit tests.'
]

trafficReplies = [
  'I\'m gonna drive backwards and get some of that gas back.',
  'Well, there\'s a lot of congestion on the highway, so you might want to consider an alternate route. Like, down the side of a steep mountain.'
]

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

runningLateReplies = [
  'The trouble with being punctual is that nobody’s there to appreciate it.'
]

drunkReplies = [
  'Yep, that first morning beer is always the best.',
  'I feel trembly, oh so shaky, I\'ve had whiskey and vodka and giiiinnnnn!',
  'Ah, Temple Foster, where they worship Australian beer.'
]

cheerReplies = [
  'YEAH! WHY AM I CHEERING, I DON\'T KNOW, BUT YEAH!',
  'Cheer! Now with Color Guard Technology!'
]

foodReplies = [
  'Everyone! Soylent Green is made from chickens!',
  'Rattlesnake. Velveeta.'
]

coffeeReplies = [
  'Dye! That\'s what this coffee tastes like. Dye!',
  'You know, our coffee tastes like it came out of an oil derrick. What\'d you strain it through, a mummy?'
]

hugReplies = [
  'http://i.imgur.com/cFId9Js.gifv'
]

bugReplies = [
  'http://i.imgur.com/7cyL3Mg.gifv'
]

raceConditionReplies = [
  'https://i.imgur.com/g74QhGM.jpg'
]

badIdeaReplies = [
  'Oh why don\'t you just shout down every idea I have? How about you call Bruce Springsteen and tell him to get another nickname since you\'re already the Boss! Huh? Yeah? Yeah!'
]

drinkReplies = [
  'Here, be sure to drink it all, sometimes the poison is on the bottom.'
]

theoryReplies = [
  'The scientific theory I like best is that the rings of Saturn are composed entirely of lost airline luggage.' 
]

argumentReplies = [
  'Nothing sucks more than that moment during an argument when you realize you’re wrong.'
]

skydiveReplies = [
  'If at first you don’t succeed... so much for skydiving.'
]

chickenReplies = [
  'I dream of a better tomorrow, where chickens can cross the road and not be questioned about their motives.'
]

victoryReplies = [
  "http://thejointblog.com/wp-content/uploads/2013/04/victory.jpg",
  "http://www.quickmeme.com/img/ea/ea4671998341d9fbb6f7815394b49cb2890a50ac80b62802fb021c147c068d8e.jpg",
  "http://cdn-media.hollywood.com/images/l/victory_620_080712.jpg",
  "http://cf.chucklesnetwork.agj.co/items/5/5/9/6/0/one-does-not-simply-declare-victory-but-i-just-did.jpg",
  "http://t.qkme.me/3qlspk.jpg",
  "http://img.pandawhale.com/86036-victory-dance-gif-Despicable-M-EPnS.gif",
  "http://1.bp.blogspot.com/-rmJLwpPevTg/UOEBgVNiVFI/AAAAAAAAFFY/-At3Z_DzBbw/s1600/dancing+charlie+murphy+animated+gif+victory+dance.gif",
  "http://www.gifbin.com/bin/20048442yu.gif",
  "http://www.quickmeme.com/img/30/300ace809c3c2dca48f2f55ca39cbab24693a9bd470867d2eb4e869c645acd42.jpg",
  "http://jeffatom.files.wordpress.com/2013/09/winston-churchill-says-we-deserve-victory.jpg",
  "http://i.imgur.com/lmmBt.gif",
  "http://danceswithfat.files.wordpress.com/2011/08/victory.jpg",
  "http://stuffpoint.com/family-guy/image/56246-family-guy-victory-is-his.gif",
  "http://thelavisshow.files.wordpress.com/2012/06/victorya.jpg",
  "http://alookintomymind.files.wordpress.com/2012/05/victory.jpg",
  "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2QwL2JyYWRwaXR0LmJjMmQyLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/1a5a0c57/968/brad-pitt.jpg",
  "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2ViL2hpZ2hzY2hvb2xtLjI4YjJhLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/4755556e/b82/high-school-musical-victory.jpg",
  "http://rack.2.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2ZkL25hcG9sZW9uZHluLjBiMTFlLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/8767246f/d7a/napoleon-dynamite.jpg",
  "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2RiL3RvbWZlbGRvbi41NmRjNi5naWYKcAl0aHVtYgk4NTB4NTkwPgplCWpwZw/05cd12cc/645/tom-feldon.jpg",
  "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2JmL2hpbXltLjU4YTEyLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/90a990f6/b38/himym.jpg",
  "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1L2U1L2NvbGJlcnRyZXBvLjVjNmYxLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/710824a0/764/colbert-report.jpg",
  "http://rack.1.mshcdn.com/media/ZgkyMDEzLzA4LzA1LzYyL2FuY2hvcm1hbi42NjJkYS5naWYKcAl0aHVtYgk4NTB4NTkwPgplCWpwZw/009ee80f/1c0/anchorman.jpg",
  "http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzA1LzFmL2hhcnJ5cG90dGVyLjYxNjYzLmdpZgpwCXRodW1iCTg1MHg1OTA-CmUJanBn/db79fc85/147/harry-potter.jpg",
  "http://www.velocityindiana.org/wp-content/uploads/2014/08/bff.gif",
  "http://i.kinja-img.com/gawker-media/image/upload/s--_dYUH9jW--/18vvnw5taib2ogif.gif",
  "https://31.media.tumblr.com/e844e0925dbd8699ddb68fb2408d61b6/tumblr_mqrjr2oH0G1r3kc9vo1_250.gif",
  "http://i.kinja-img.com/gawker-media/image/upload/s--0wAEcaN4--/c_fit,fl_progressive,q_80,w_636/bdbtzjrhyyuarpfbqksn.gif",
  "http://media.giphy.com/media/vpybhig8QFLOM/giphy.gif",
  "https://media.giphy.com/media/3o85xzwOcKkOw67ywg/giphy.gif",
  "https://ladygeekgirl.files.wordpress.com/2012/01/1352309-huzzah1_super1.jpg"
]

starWarsReplies = [
  'https://i.imgur.com/el6C68M.gif',
  'https://i.imgur.com/wv2wnW2.jpg',
  'https://i.imgur.com/y3GgF9y.jpg',
  'https://i.imgur.com/OcVirS0.jpg',
  'https://i.imgur.com/mBBoeT7.jpg',
  'https://i.imgur.com/myMj1L0.jpg',
  'https://i.imgur.com/vk2Tast.jpg',
  'https://i.imgur.com/0PkcZut.jpg',
  'https://i.imgur.com/iu3Z4US.jpg',
  'https://i.imgur.com/JxWnWEs.jpg',
  'https://i.imgur.com/fcRE2qs.jpg',
  'https://www.youtube.com/watch?v=hEcjgJSqSRU',
  'https://www.youtube.com/watch?v=CeLrlmV9A-s',
  'https://www.youtube.com/watch?v=3zYOw7v6TFE',
  'https://www.youtube.com/watch?v=gd5yB9Vmd6I'
]

worstCaseScenarioReplies = [
    "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fresabi.files.wordpress.com%2F2010%2F11%2Fwurst.jpg&sp=792aa5566d2e759cbf257675d47e02dc"
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
    res.send res.random leaveReplies if willRespond()

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
  
  # Cheer
  robot.respond /cheer/i, (msg) ->
    msg.reply msg.random cheerReplies
    
  # Need Food
  robot.respond /(get|need)\b.+\bfood\b/igm, (msg) ->
    msg.reply msg.random foodReplies
  
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
    
  # Show the Friday guy when someone mentions Friday
  robot.hear /friday/i, (msg) ->
    msg.send msg.random fridayReplies if willRespond()
  
  # Give 'em an emergency hug
  robot.hear /\b(need|needs)\b.+\bhug\b/igm, (msg) ->
    msg.send msg.random hugReplies if willRespond()
  
  # Somebody found a bug!
  robot.hear /\bfound\b.+\bbug\b/igm, (msg) ->
    msg.send msg.random bugReplies if willRespond()
  
  # Somebody tried to blame it on a race condition
  robot.hear /race\s?condition/i, (msg) ->
    msg.send msg.random raceConditionReplies if willRespond()
    
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

  # Bad idea!
  robot.hear /bad idea/i, (msg) ->
    msg.reply msg.random badIdeaReplies if willRespond()    
  
  # This coffee sucks!
  robot.hear /coffee/i, (msg) ->
    msg.send msg.random coffeeReplies if willRespond()

  # Have something to drink
  robot.hear /something to drink/i, (msg) ->
    msg.reply msg.random drinkReplies if willRespond()

  # Drunk
  robot.hear /(\W|^)(drunk|margarita|cantina|beer|whiskey|vodka|booze)(\W|$)/i, (msg) ->
    msg.send msg.random drunkReplies if willRespond()

  # Traffic
  robot.hear /traffic/i, (msg) ->
    msg.reply msg.random trafficReplies if willRespond()

  # Trouble
  robot.hear /trouble/i, (msg) ->
    msg.send msg.random troubleReplies if willRespond()

  # Theory
  robot.hear /theory/i, (msg) ->
    msg.send msg.random theoryReplies if willRespond()
 
  # Skydive
  robot.hear /(\W|^)(skydive|skydiving|parachute)(\W|$)/i, (msg) ->
    msg.reply msg.random skydiveReplies if willRespond()

  # Argument
  robot.hear /argument/i, (msg) ->
    msg.send msg.random argumentReplies if willRespond()    

  # Chicken
  robot.hear /(\W|^)(chicken|dream)(\W|$)/i, (msg) ->
    msg.send msg.random chickenReplies if willRespond()

  # Acceptance Criteria
  robot.hear /(\W|^)(ac|spec|specification|criteria)(\W|$)/i, (msg) ->
    msg.send msg.random acReplies if willRespond()

  # Running Late
  robot.hear /\b(\W|^)(be|running)\b.+\blate\b(\W|$)/igm, (msg) ->
    msg.send msg.random runningLateReplies if willRespond()

  # Database
  robot.hear /(\W|^)(database|db)(\W|$)/i, (msg) ->
    msg.send msg.random databaseReplies if willRespond()
    
  # Tests Failing
  robot.hear /\b(\W|^)(test|tests)\b.+\b(failed|failing)\b(\W|$)/igm, (msg) ->
    msg.reply msg.random testFailReplies if willRespond()

  # Victory!
  robot.hear /victory\b/i, (msg) ->
    msg.send msg.random victoryReplies if willRespond()
    
  # Star Wars
  robot.hear /star wars/i, (msg) ->
    msg.send msg.random starWarsReplies
  
  # Worst Case Scenario
  robot.hear /worst.*case.*scenario/i, (msg) ->
    msg.send msg.random worstCaseScenarioReplies
