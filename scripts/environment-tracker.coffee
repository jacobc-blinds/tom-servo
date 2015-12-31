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
#   hubot assign environment - Assigns an environment to the requesting user
#   hubot show environments - Shows the assigned environments
#
# Author:
#   Greg Major

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
    
    if environmentName in ["PRODUCTION", "PROD"]
      @robot.send {room: user}, "Nice try."
      return
   
    if environmentName not in expectedEnvironmentNames
      @robot.send {room: user}, "That isn't an environment name I recognize, but okay. If you made a mistake, you can always delete it."
    
    # Get the existing environment...
    existingEnvironment = @getEnvironment environmentName
    
    if existingEnvironment
      @robot.send {room: existingEnvironment.user}, "Hey, #{existingEnvironment.user}! #{user} is taking control of #{environmentName}!"
    
    # Delete the old environment assignment...
    this.deleteByName environmentName
    
    # Get the formatted date...
    dateAssigned = this.getFormattedDate()
    
    # Create the new environment assignment...
    newEnvironmentAssignment = {key: environmentName, date: dateAssigned, user: user}
    
    # Push to the array and update the brain...
    @assignedEnvironments.push newEnvironmentAssignment
    @updateBrain @assignedEnvironments
    
    @robot.send {room: user}, "Okay, I have assigned environment #{newEnvironmentAssignment.key} to you as of #{dateAssigned}." 
  
  # Deletes an assigned environment.
  deleteByName: (environmentName) ->
    found = (environment for environment in @assignedEnvironments when environment.key.toUpperCase() is environmentName.toUpperCase())
    if not found || found.length == 0
      return "Environment #{environmentName} does not exist!"
    @assignedEnvironments = @assignedEnvironments.filter (n) -> n.key != environmentName
    @updateBrain @assignedEnvironments
    return "Okay, I have deleted #{environmentName}."
  
  # Deletes all the assigned environments.
  deleteAll: () ->
    @assignedEnvironments = []
    @updateBrain @assignedEnvironments
    return "Okay, I have deleted all environments. May QA have mercy on your soul."
  
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
    response = "\n"
    
    if not @assignedEnvironments || @assignedEnvironments.length == 0
      response += "I haven't assigned any environments!"
    else
      for environment in @assignedEnvironments
        response += "#{environment.key} is assigned to #{environment.user} as of #{environment.date}.\n"
    
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
  robot.respond /(assign|give me|take|steal) environment (.+?)$/i, (msg) ->
    environmentName = msg.match[2]
    result = tracker.add(msg, environmentName, msg.message.user.name)

  # hubot delete all environments
  robot.respond /delete all environments/i, (msg) ->
    result = tracker.deleteAll()
    msg.send result

  # hubot delete environment <name>
  robot.respond /delete environment (.+?)$/i, (msg) ->
    environmentName = msg.match[1]
    console.log environmentName
    result = tracker.deleteByName(environmentName)
    msg.send result

  # hubot show environments
  robot.respond /(show|list) environments/i, (msg) ->
    result = tracker.showAll()
    msg.send result
