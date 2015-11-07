# Description:
#   Run a hubot command whenever hubot hears something in conversation.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot when you hear <pattern> do <something hubot does> - Start snooping
#   hubot when you hear <pattern> do 1|<something hubot does>; 2|<some.... - Start snooping with multiple reactions in order
#   hubot stop snooping - Stop all snooping
#   hubot stop snooping on <pattern> - Remove a particular snoop
#   hubot show snooping - Show what hubot is snooping on
#
# Author:
#   Greg Major

TextMessage = require('hubot').TextMessage

# Snoop, snoop, snoop, sha-noop!
class Snoop
  
  constructor: (@robot) ->
    
    # Start with an empty cache...
    @cache = []
    
    # When the brain loads, grab our cached data...
    @robot.brain.on 'loaded', =>
      if @robot.brain.data.Snoop
        @cache = @robot.brain.data.snoop
  
  # Adds a new snoop.
  add: (pattern, action, order) ->
    task = {key: pattern, task: action, order: order}
    @cache.push task
    @robot.brain.data.snoop = @cache
  
  # Gets all the snoops. ALL THE SNOOPS!
  all: -> @cache
  
  # Deletes a snoop based on a pattern.
  deleteByPattern: (pattern) ->
    @cache = @cache.filter (n) -> n.key != pattern
    @robot.brain.data.snoop = @cache
  
  # Deletes all the snoops. You bastard!
  deleteAll: () ->
    @cache = []
    @robot.brain.data.snoop = @cache

module.exports = (robot) ->
  
  # Fire up our snooper (wrap the bot)...
  snoop = new Snoop robot

  # hubot when you hear <pattern> do <something hubot does>
  robot.respond /when you hear (.+?) do (.+?)$/i, (msg) ->    
    
    key = msg.match[1]
    
    for task_raw in msg.match[2].split ";"
      task_split = task_raw.split "|"
      
      # If it's a single task, there's no need to order...
      if not task_split[1]
        snoop.add(key, task_split[0])
      else
        snoop.add(key, task_split[1], task_split[0])
    
    msg.send "Shhhh! I am now snooping for #{key}."

  # hubot stop snooping
  robot.respond /stop snooping$/i, (msg) ->
    snoop.deleteAll()
    msg.send 'The cops are coming! Cheese it!'

  # hubot stop snooping on <pattern>
  robot.respond /stop snooping (for|on) (.+?)$/i, (msg) ->
    pattern = msg.match[2]
    snoop.deleteByPattern(pattern)
    msg.send "Okay, I will stop snooping on #{pattern} from now on."

  # hubot show snooping
  robot.respond /show snooping/i, (msg) ->
    response = "\n"
    
    for task in snoop.all()
      response += "#{task.key} -> #{task.task}\n"
    
    msg.send response
  
  # hubot parrot <message> to <channel>
  robot.respond /parrot (.+?) to (.+?)$/i, (msg) ->
    
    message = msg.match[1]
    channel = msg.match[2]
    
    try robot.send room: "#{channel}", "#{message}"
    catch ex then console.log "Crud! #{ex}."

  # Listen to, well... everything pretty much.
  robot.hear /(.+)/i, (msg) ->
    
    # Grab what we heard...
    robotHeard = msg.match[1]

    # Grab what we know...
    tasks = snoop.all()
    
    # Sort what we know...
    tasks.sort (a,b) ->
      return if a.order >= b.order then 1 else -1

    # Start with an empty set of tasks...
    tasksToRun = []
    
    # Now grab every task that matches our key...
    for task in tasks
      if new RegExp(task.key, "i").test(robotHeard)
        tasksToRun.push task

    # Now sort 'em so they play in the requested order...
    tasksToRun.sort (a,b) ->
      return if a.order >= b.order then 1 else -1

    # Boom-shaka-lakka...
    for task in tasksToRun
      
      # If the message didn't come from our robot then...
      if (robot.name != msg.message.user.name && !(new RegExp("^#{robot.name}", "i").test(robotHeard)))
        
        # If we're supposed to parrot what we heard then...
        if (/parrot to/i.test(task.task))
          
          # Snag the channel name...
          parrotPattern = /parrot to (.+?)$/i
          
          taskmatch = parrotPattern.exec (task.task)
          
          channel = taskmatch[1]
          
          # Now fire it off...
          try robot.send room: "#{channel}", "#{robotHeard}"
          catch ex then console.log "Crud! #{ex}."
        
        else
          
          # Tell our robot to do something...
          robot.receive new TextMessage(msg.message.user, "#{robot.name}: #{task.task}")