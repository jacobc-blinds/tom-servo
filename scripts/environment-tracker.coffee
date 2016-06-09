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
        "STAGE2",
        "PRODUCTION"
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
  
  # Gets all the environment details.
  getAllEnvironmentDetails: () ->
    currentThdRail = "71" # Changing this will change the URL for some sites.
    
    return [
      {
          key: "PRODUCTION",
          ronaele: "https://admin.blinds.ca/",
          bdc: "https://web.blinds.com/",
          bca: "https://www.blinds.ca/",
          thd: "https://blinds.homedepot.com/",
          thdm: "http://m.blinds.homedepot.com/",
          thdt: "http://t.blinds.homedepot.com/",
          thdapi: "http://blinds-api.homedepot.com/",
          rabbitmq: "http://internal-prod1-rabbit-2052930617.us-east-1.elb.amazonaws.com:15672/",
          sod: "http://blindsadmin.prod1.blinds.com/SalesOrderDistribution/OrderDistribution",
          pops: "unassigned"
      },
      {
          key: "STAGE",
          ronaele: "http://stage.admin.blinds.ca/",
          bdc: "http://stage.autobahn.blinds.com/",
          bca: "http://stage.www.blinds.ca/",
          thd: "https://stage-blinds.hd-qp71.homedepotdev.com/",
          thdm: "http://t.dev-blinds.hd-st71.homedepotdev.com/",
          thdt: "http://t.stage-blinds.hd-qp71.homedepotdev.com/",
          thdapi: "http://stage.thdapi.blinds.ca/",
          rabbitmq: "http://internal-stage1-rabbit-1727276512.us-east-1.elb.amazonaws.com:15672/",
          sod: "http://blindsadmin.stage1.blinds.com/SalesOrderDistribution/OrderDistribution",
          pops: "unassigned"
      },
      {
          key: "UAT",
          ronaele: "http://uat.admin.blinds.ca/",
          bdc: "http://uat.autobahn.blinds.com/",
          bca: "http://uat.www.blinds.ca/",
          thd: "https://uat-blinds.hd-qa72stg.homedepotdev.com/",
          thdm: "http://m.uat-blinds.hd-qa72stg.homedepotdev.com/",
          thdt: "http://t.uat-blinds.hd-qa72stg.homedepotdev.com/",
          thdapi: "http://uat.thdapi.blinds.ca/",
          rabbitmq: "http://internal-test-rabbit-1582700312.us-east-1.elb.amazonaws.com:15672/",
          sod: "http://blindsadmin.uat1.blinds.com/SalesOrderDistribution/OrderDistribution",
          pops: "unavailable"
      },
      {
          key: "QA1",
          ronaele: "http://qa1.admin.blinds.ca/",
          bdc: "http://qa1.autobahn.blinds.com/",
          bca: "http://qa1.www.blinds.ca/",
          thd: "http://qa-blinds.hd-qa#{currentThdRail}.homedepotdev.com/",
          thdm: "http://m.qa-blinds.hd-qa#{currentThdRail}.homedepotdev.com/",
          thdt: "http://t.qa-blinds.hd-qa#{currentThdRail}.homedepotdev.com/",
          thdapi: "http://qa1.thdapi.blinds.ca/",
          rabbitmq: "http://internal-test-rabbit-1582700312.us-east-1.elb.amazonaws.com:15672/",
          sod: "unavailable",
          pops: "unavailable"
      },
      {
          key: "QA2",
          ronaele: "http://qa2.admin.blinds.ca/",
          bdc: "http://qa2.autobahn.blinds.com/",
          bca: "http://qa2.www.blinds.ca/",
          thd: "http://qa2.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdm: "http://m-qa2.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdt: "unavailable",
          thdapi: "http://qa2.thdapi.blinds.ca/",
          rabbitmq: "http://internal-test-rabbit-1582700312.us-east-1.elb.amazonaws.com:15672/",
          sod: "unavailable",
          pops: "unavailable"
      },
      {
          key: "QA3",
          ronaele: "http://qa3.admin.blinds.ca/",
          bdc: "http://qa3.autobahn.blinds.com/",
          bca: "http://qa3.www.blinds.ca/",
          thd: "http://qa3.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdm: "http://m-qa3.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdt: "unavailable",
          thdapi: "http://qa3.thdapi.blinds.ca/",
          rabbitmq: "http://internal-test-rabbit-1582700312.us-east-1.elb.amazonaws.com:15672/",
          sod: "unavailable",
          pops: "unavailable" 
      },
      {
          key: "QA4",
          ronaele: "http://qa4.admin.blinds.ca/",
          bdc: "http://qa4.autobahn.blinds.com/",
          bca: "http://qa4.www.blinds.ca/",
          thd: "http://qa4.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdm: "http://m-qa4.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdt: "unavailable",
          thdapi: "http://qa4.thdapi.blinds.ca/",
          rabbitmq: "http://internal-test-rabbit-1582700312.us-east-1.elb.amazonaws.com:15672/",
          sod: "unavailable",
          pops: "unavailable" 
      },
      {
          key: "DEV",
          ronaele: "http://dev.admin.blinds.ca/",
          bdc: "http://dev.autobahn.blinds.com/",
          bca: "http://dev.www.blinds.ca/",
          thd: "http://dev.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdm: "http://m-dev.thd.blinds.ca/p/levolor-classic-2-in-faux-wood-blind/205930452",
          thdt: "http://t.dev-blinds.hd-st71.homedepotdev.com/",
          thdapi: "http://dev.thdapi.blinds.ca/",
          rabbitmq: "http://internal-test-rabbit-1582700312.us-east-1.elb.amazonaws.com:15672/",
          sod: "http://blindsadmin.dev1.blinds.com/SalesOrderDistribution/OrderDistribution",
          pops: "unavailable" 
      }
    ]
  
  # Gets the details for an environment.
  getEnvironmentDetails: (environmentName) ->
    allDetails = @getAllEnvironmentDetails()
    
    found = (detail for detail in allDetails when detail.key.toUpperCase() is environmentName.toUpperCase())
    
    if not found || found.length == 0
      return
    
    return found[0]
  
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
    
    response += "```"
    
    return response
    
  # get all the assigned environments data
  getAll: () ->
    return @assignedEnvironments
  
  # Shows details about an environment.
  showDetail: (environmentName) ->
    environmentName = environmentName.toUpperCase()
    
    if not @environmentExists environmentName
      return "Environment #{environmentName} does not exist!"
    
    details = @getEnvironmentDetails environmentName
    
    if not details 
      return "No details found for #{environmentName}!"
    
    response = "```\n"
    response += "Here are the details for #{environmentName}:\n\n"
    
    for k,v of details
      response += "#{k}: #{v}\n"
    
    response += "```"
    
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

  # hubot show environment <name> details
  robot.respond /(show|list) (environment|env) (.+?) (detail|details)$/i, (msg) ->
    environmentName = msg.match[3]
    result = tracker.showDetail(environmentName)
    msg.send result

# hubot environment help
  robot.respond /(environment|environments|env) help/i, (msg) ->
    help = "\n"
    help += "Here are the environment tracking commands you can give me:\n\n"
    help += "assign environment <name> - Assigns an environment to the requesting user\n"
    help += "assign environment <name> to <user> - Assigns an environment to a user\n"
    help += "release environment <name> - Releases an assigned environment\n"
    help += "show environments - Shows the assigned environments\n"
    help += "show environment <name> details - Shows details about an environment\n"
    help += "delete environment <name> - Deletes an environment assignment\n"
    help += "delete all environments - Deletes all environments\n"
    help += "environment help - Shows this help message"
    msg.send help
   
# ##### 
# REST API to get environment list of current environments. 
# Do a GET call to http://<servos-host-address>/servo/environments/list
# #####
  robot.router.get '/servo/environments/list', (req, res) ->
    res.send tracker.getAll()