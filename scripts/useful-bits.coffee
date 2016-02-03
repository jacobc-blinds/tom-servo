# Description:
#   These are useful little bits that hubot can do for you.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Greg Major

stringTable = require('string-table')

module.exports = (robot) ->

  # Test Credit Cards
  robot.respond /\b(\W|^)(test|tests)\b.+\b(card|credit card)\b(\W|$)/igm, (msg) ->
    msg.reply "Here are some test credit card numbers:\nAmerican Express - 378282246310005\nDiners Club - 38520000023237\nDiscover - 6011111111111117\nJCB - 3530111333300000\nMasterCard - 5555555555554444\nVisa - 4111111111111111\n"

  # Test Address (Canadian)
  robot.respond /\b(\W|^)(test|testing)\b.+\baddress\b(\W|$)/igm, (msg) ->
    msg.reply "Here's a valid Canadian test address:\nAttention: Rachelle Zimmer\nAddress: Box 8 Site 908 RR9\nCity, State, Zip: Saskatoon SK, S7K 1P3"

  # Test Accounts
  robot.respond /\b(\W|^)(test|testing)\b.+\b(accounts|account)\b(\W|$)/igm, (msg) ->
    msg.reply "Here are the Autobahn test accounts:\nnobrainer2\\acstest1 (Customer Service Manager)\nnobrainer2\\acstest2 (Accounting Manager)\nnobrainer2\\SOTManager"
  
  # Tool Links
  robot.respond /\b(\W|^)(show|list|find)\b.+\b(tools|urls|links|octopus|teamcity|slack|rabbit|rabbitops)\b(\W|$)/igm, (msg) ->    
    links = [
      {
        name: "TeamCity",
        url: "http://dev-deploy-1.nobrainer2.com:81/"
      }
      {
        name: "Octopus",
        url: "http://deploy.southsidesoft.com/"
      }
      {
        name: "Slack",
        url: "https://globalcustomcommerce.slack.com/"
      }
      {
        name: "Rabbit Operations",
        url: "http://rabbitops.blinds.ca:8082/"
      }
    ]
    
    response = "```\n"
    response += stringTable.create(links, { capitalizeHeaders: true })
    response += "```"
    
    msg.reply response
    