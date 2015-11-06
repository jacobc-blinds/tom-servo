# Description:
#   Run a command whenever hubot hears something in conversation.
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

class Snoop
  
  constructor: (@robot) ->
    @cache = []
    @robot.brain.on 'loaded', =>
      if @robot.brain.data.Snoop
        @cache = @robot.brain.data.snoop
  
  add: (pattern, action, order) ->
    task = {key: pattern, task: action, order: order}
    @cache.push task
    @robot.brain.data.snoop = @cache
  
  all: -> @cache
  
  deleteByPattern: (pattern) ->
    @cache = @cache.filter (n) -> n.key != pattern
    @robot.brain.data.snoop = @cache
  
  deleteAll: () ->
    @cache = []
    @robot.brain.data.snoop = @cache

module.exports = (robot) ->
  
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
    msg.send 'Aw, man! Everything? Fine!'

  # hubot stop snooping on <pattern>
  robot.respond /stop snooping (for|on) (.+?)$/i, (msg) ->
    pattern = msg.match[2]
    snoop.deleteByPattern(pattern)
    msg.send "Okay, I will ignore #{pattern} from now on."

  hubot show snooping
  robot.respond /show snooping/i, (msg) ->
    response = "\n"
    for task in snoop.all()
      response += "#{task.key} -> #{task.task}\n"
    msg.send response

  robot.hear /(.+)/i, (msg) ->
    robotHeard = msg.match[1]

    tasks = snoop.all()
    tasks.sort (a,b) ->
      return if a.order >= b.order then 1 else -1

    tasksToRun = []
    for task in tasks
      if new RegExp(task.key, "i").test(robotHeard)
        tasksToRun.push task

    tasksToRun.sort (a,b) ->
      return if a.order >= b.order then 1 else -1

    for task in tasksToRun
      if (robot.name != msg.message.user.name && !(new RegExp("^#{robot.name}", "i").test(robotHeard)))
        robot.receive new TextMessage(msg.message.user, "#{robot.name}: #{task.task}")