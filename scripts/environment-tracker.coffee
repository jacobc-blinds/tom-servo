# Description:
#   Makes hubot keep track of your environments.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot assign environment <name> - Assigns an environment to the requesting user
#   hubot assign environment <name> to <user> - Assigns an environment to a user
#   hubot release environment <name> - Releases an assigned environment
#   hubot show environments - Shows the assigned environments
#   hubot delete environment <name> - Deletes an environment assignment
#   hubot delete all environments - Deletes all environments
#   hubot environment help - Shows a help message for environment tracking
#
# Author:
#   Greg Major

stringTable = require('string-table')
#require('string-table')

class EnvironmentTracker

  constructor: (@robot) ->    
    
    # Try to snag saved assigned environments...
    @assignedEnvironments = @robot.brain.get('environments')
    
    # If there's not anything then simply init to empty...
    if not @assignedEnvironments
      @assignedEnvironments = []
    
    @robot.brain.on 'loaded', =>
      @brainEnvironments = @robot.brain.get('environments')
      
      if @brainEnvironments
        @assignedEnvironments = @brainEnvironments

  # Gets all the environments. ALL THE ENVIRONMENTS!
  assignedMigrations: -> @assignedEnvironments
  
  # Assigns a new environment.
  add: (msg, environmentName, user) ->
    
    expectedEnvironmentNames = [
        "QA1",
        "QA2",
        "QA3",
        "QA4",
        "QA5",
        "STAGE",
        "DEV",
        "UAT",
        "STAGE2"
    ]
    
    environmentName = environmentName.toUpperCase()
    
    # Prevent someone from assigning production to themselves...
    if environmentName in ["PRODUCTION", "PROD"]
      try @robot.send {room: user}, "Nice try."
      catch ex then console.log ex
      return "Hey, we need to keep an eye on this person!"
   
    # Warn if the environment name doesn't match our expected names...
    if environmentName not in expectedEnvironmentNames
      try @robot.send {room: user}, "That isn't an environment name I recognize, but okay. If you made a mistake, you can always delete it."
      catch ex then console.log ex
    
    # Get the existing environment...
    existingEnvironment = @getEnvironment environmentName
      
    # Bark and bail if the environment has already been assigned to the requesting user...
    if existingEnvironment and existingEnvironment.user.toUpperCase() is user.toUpperCase()
      return "#{environmentName} is already assigned to you!"
    
    # Tell the existing user that someone has taken their environment...
    if existingEnvironment
      try @robot.send {room: existingEnvironment.user}, "Hey, #{existingEnvironment.user}! #{user} is taking control of #{environmentName}!"
      catch ex then console.log ex
    
    # #####
    # Okay, at this point we've done all our validations and whatnot so let's get to business...
    # #####
    
    # Delete the old environment assignment...
    this.deleteByName environmentName
    
    # Get the formatted date...
    dateAssigned = this.getFormattedDate()
    
    # Create the new environment assignment...
    newEnvironmentAssignment = {key: environmentName, date: dateAssigned, user: user}
    
    # Push to the array and update the brain...
    @assignedEnvironments.push newEnvironmentAssignment
    @updateBrain @assignedEnvironments
    
    return "Okay, I have assigned environment #{newEnvironmentAssignment.key} to #{user} as of #{dateAssigned}." 
  
  # Releases an assigned environment.
  release: (environmentName) ->
  
    environmentName = environmentName.toUpperCase()
  
    if not @environmentExists environmentName
      return "Environment #{environmentName} does not exist!"
    
    this.deleteByName environmentName
    
    # Get the formatted date...
    dateAssigned = this.getFormattedDate()
    
    # Create the new environment assignment...
    newEnvironmentAssignment = {key: environmentName, date: dateAssigned, user: ""}
    
    console.log "The new env is: #{newEnvironmentAssignment}"
    
    # Push to the array and update the brain...
    @assignedEnvironments.push newEnvironmentAssignment
    @updateBrain @assignedEnvironments
    
    return "Okay, I have released environment #{newEnvironmentAssignment.key} as of #{dateAssigned}."
      
  # Deletes an assigned environment.
  deleteByName: (environmentName) ->
    environmentName = environmentName.toUpperCase()
    
    if not @environmentExists environmentName
      return "Environment #{environmentName} does not exist!"
    
    @assignedEnvironments = @assignedEnvironments.filter (n) -> n.key != environmentName.toUpperCase()
    @updateBrain @assignedEnvironments
    
    return "Okay, I have deleted #{environmentName}."
  
  # Deletes all the assigned environments.
  deleteAll: () ->
    @assignedEnvironments = []
    @updateBrain @assignedEnvironments
    return "Okay, I have deleted all environments. May QA have mercy on your soul."
  
  # Returns true if an environment exists, false otherwise.
  environmentExists: (environmentName) ->
    found = (environment for environment in @assignedEnvironments when environment.key.toUpperCase() is environmentName.toUpperCase())
    
    if not found || found.length == 0
      return false
    
    return true
  
  # Gets an environment record by name.
  getEnvironment: (environmentName) ->
    found = (environment for environment in @assignedEnvironments when environment.key.toUpperCase() is environmentName.toUpperCase())
    
    if not found || found.length == 0
      return
    
    return found[0]
  
  # Gets the formatted date.
  getFormattedDate: () ->
    today = new Date
    dd = today.getDate()
    mm = today.getMonth() + 1 # We have to add one since it's zero-based
    yyyy = today.getFullYear()
    if dd < 10
        dd = '0' + dd
    if mm < 10
        mm = '0' + mm
    return "#{yyyy}-#{mm}-#{dd}"
  
  # Shows all the assigned environments.
  showAll: () ->
    response = "```\n"
    
    if not @assignedEnvironments || @assignedEnvironments.length == 0
      response += "I haven't assigned any environments!"
    else  
      response += stringTable.create(@assignedEnvironments, { capitalizeHeaders: true, headers: ['key', 'user', 'date'] })
    
    response = "```"
    
    return response
  
  # Updates the robot brain. BRAAAAINS!
  updateBrain: (assignedEnvironments) ->
    assignedEnvironments.sort (a, b) ->
      return if a.key.toUpperCase() >= b.key.toUpperCase() then 1 else -1
    @robot.brain.set 'environments', assignedEnvironments
    return

module.exports = (robot) ->
  
  # Fire up our tracker (wrap the bot)...
  tracker = new EnvironmentTracker robot
  
  # hubot assign environment <name>
  robot.respond /(assign|give me|take|steal) (environment|env) ([^ ]+)$/i, (msg) ->
    environmentName = msg.match[3]
    result = tracker.add(msg, environmentName, msg.message.user.name)
    msg.send result

  # hubot assign environment <name> to <user>
  robot.respond /(assign|give) (environment|env) ([^ ]+) to ([^ ]+)$/i, (msg) ->
    environmentName = msg.match[3]
    assignee = msg.match[4]
    result = tracker.add(msg, environmentName, assignee)
    msg.send result
  
  # hubot release environment <name>
  robot.respond /(release|relinquish|abandon) (environment|env) ([^ ]+)$/i, (msg) ->
    environmentName = msg.match[3]
    result = tracker.release(environmentName)
    msg.send result
  
  # hubot delete all environments
  robot.respond /delete all environments/i, (msg) ->
    result = tracker.deleteAll()
    msg.send result

  # hubot delete environment <name>
  robot.respond /delete (environment|env) (.+?)$/i, (msg) ->
    environmentName = msg.match[2]
    result = tracker.deleteByName(environmentName)
    msg.send result

  # hubot show environments
  robot.respond /(show|list) environments/i, (msg) ->
    result = tracker.showAll()
    msg.send result
  
  # hubot environment help
  robot.respond /(environment|environments|env) help/i, (msg) ->
    help = "\n"
    help += "Here are the environment tracking commands you can give me:\n\n"
    help += "assign environment <name> - Assigns an environment to the requesting user\n"
    help += "assign environment <name> to <user> - Assigns an environment to a user\n"
    help += "release environment <name> - Releases an assigned environment\n"
    help += "show environments - Shows the assigned environments\n"
    help += "delete environment <name> - Deletes an environment assignment\n"
    help += "delete all environments - Deletes all environments\n"
    help += "environment help - Shows this help message"
    msg.send help
