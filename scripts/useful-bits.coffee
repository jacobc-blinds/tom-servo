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

module.exports = (robot) ->

  # Test Credit Cards
  robot.hear /\b(\W|^)(test|tests)\b.+\b(card|credit card)\b(\W|$)/igm, (msg) ->
    msg.reply "Here are some test credit card numbers:\nAmerican Express - 378282246310005\nDiners Club - 38520000023237\nDiscover - 6011111111111117\nJCB - 3530111333300000\nMasterCard - 5555555555554444\nVisa - 4111111111111111\n"

  # Test Address (Canadian)
  robot.hear /\b(\W|^)(test|testing)\b.+\baddress\b(\W|$)/igm, (msg) ->
    msg.reply "Here's a valid Canadian test address:\nAttention: Rachelle Zimmer\nAddress: Box 8 Site 908 RR9\nCity, State, Zip: Saskatoon SK, S7K 1P3"

  # Test Accounts
  robot.hear /\b(\W|^)(test|testing)\b.+\b(accounts|account)\b(\W|$)/igm, (msg) ->
    msg.reply "Here are the Autobahn test accounts:\nnobrainer2\\acstest1 (Customer Service Manager)\nnobrainer2\\acstest2 (Accounting Manager)\nnobrainer2\\SOTManager"
    
  # TeamCity URL
  robot.hear /\b(\W|^)(team city|teamcity)\b.+\b(url|uri|address|link)\b(\W|$)/igm, (msg) ->
    msg.reply "Here's a link to the TeamCity server... http://dev-deploy-1.nobrainer2.com:81"
  
  # Octopus URL
  robot.hear /\b(\W|^)(octopus)\b.+\b(url|uri|address|link)\b(\W|$)/igm, (msg) ->
    msg.reply "Here's a link to the Octopus server... http://deploy.southsidesoft.com"