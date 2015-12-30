# Description:
#   Makes hubot keep track of your database migrations.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot assign migration - Assigns a migration number to the requesting user
#   hubot delete migration <name> - Deletes an assigned migration
#   hubot show migrations - Shows the assigned migrations
#
# Author:
#   Greg Major

#TextMessage = require('hubot').TextMessage
#SlackBotListener = require('hubot-slack').SlackBotListener

class MigrationTracker

  constructor: (@robot) ->    
    
    # Try to snag saved assigned migrations...
    @assignedMigrations = @robot.brain.get('migrations')
    
    # If there's not anything then simply init to empty...
    if not @assignedMigrations
      @assignedMigrations = []
    
    @robot.brain.on 'loaded', =>
      @brainMigrations = @robot.brain.get('migrations')
      
      if @brainMigrations
        @assignedMigrations = @brainMigrations

  # Gets all the migrations. ALL THE MIGRATIONS!
  assignedMigrations: -> @assignedMigrations
  
  # Assigns a new migration.
  add: (user) ->
    # Get today's date in YYYYMMDD format...
    today = new Date
    dd = today.getDate()
    mm = today.getMonth() + 1 # We have to add one since it's zero-based
    yyyy = today.getFullYear()
    if dd < 10
        dd = '0' + dd
    if mm < 10
        mm = '0' + mm
    migrationDate = "#{yyyy}-#{mm}-#{dd}-"
    
    # Grab what we know...
    assignedMigrations = @assignedMigrations
    
    # Start with an empty set of migrations...
    todaysMigrations = []
    migrationNumbers = []
    
    # Now grab every migration for today...
    for migration in assignedMigrations
      if migration.date == migrationDate
        todaysMigrations.push migration
        migrationNumbers.push migration.number
    
    if migrationNumbers.length is 0
      migrationNumber = 1
    else
      migrationNumber = Math.max migrationNumbers...
      migrationNumber++
    
    migrationName = migrationDate + migrationNumber
    
    newMigration = {key: migrationName, date: migrationDate, number: migrationNumber, user: user}
    @assignedMigrations.push newMigration
    @updateBrain @assignedMigrations
    return "Okay, I have assigned migration #{newMigration.key} to you."
  
  # Deletes an assigned migration.
  deleteByName: (migrationName) ->
    found = (migration for migration in @assignedMigrations when migration.key is migrationName)
    if not found || found.length == 0
        return "Migration #{migrationName} does not exist!"
    @assignedMigrations = @assignedMigrations.filter (n) -> n.key != migrationName
    @updateBrain @assignedMigrations
    return "Okay, I have deleted #{migrationName}."
  
  # Deletes all the assigned migrations.
  deleteAll: () ->
    @assignedMigrations = []
    @updateBrain @assignedMigrations
    return "Okay, I have deleted all migrations."
  
  # Updates the robot brain. BRAAAAINS!
  updateBrain: (assignedMigrations) ->
    @robot.brain.set 'migrations', assignedMigrations
    return

module.exports = (robot) ->
  
  # Fire up our tracker (wrap the bot)...
  tracker = new MigrationTracker robot
  
  # Wire up to process bot messages...
  #robot.listeners.push new SlackBotListener(robot, /[\s\S]*/i, (msg) -> tracker.processMessage(msg, msg.message.text))

  # hubot assign migration
  robot.respond /assign migration/i, (msg) ->
    result = tracker.add(msg.message.user.name)
    msg.reply result

  # hubot delete all migrations
  robot.respond /delete all migrations$/i, (msg) ->
    result = tracker.deleteAll()
    msg.send result

  # hubot delete migration <name>
  robot.respond /delete migration (.+?)$/i, (msg) ->
    name = msg.match[1]
    result = tracker.deleteByName(name)
    msg.send result

  # hubot show migrations
  robot.respond /(show|list) migrations/i, (msg) ->
    response = "\n"
    
    if not tracker.assignedMigrations || tracker.assignedMigrations.length == 0
      response += "I haven't assigned any migrations!"
    else
      for migration in tracker.assignedMigrations
        response += "#{migration.key} is assigned to #{migration.user}\n"
    
    msg.send response
