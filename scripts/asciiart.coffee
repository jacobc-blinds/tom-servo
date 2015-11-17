# Description:
#   Get ASCII art from text.
#
# Dependencies:
#   "ascii-art": "0.0.2-alpha",
#
# Configuration:
#   None
#
# Commands:
#   hubot ascii <your text> - Get ASCII art from text (default Doom font)
#   hubot asciibasic <your text> - Get ASCII art from text (Basic font)
#   hubot asciibroadway <your text> - Get ASCII art from text (Broadway font)
#   hubot asciibulbhead <your text> - Get ASCII art from text (Bulbhead font)
#   hubot asciicontessa <your text> - Get ASCII art from text (Contessa font)
#   hubot asciidrpepper <your text> - Get ASCII art from text (Drpepper font)
#
# Author:
#   Buddy Toups
art = require('ascii-art')

module.exports = (robot) ->
  robot.respond /(ascii|asciibasic|asciibroadway|asciibulbhead|asciicontessa|asciidrpepper)\s(.*)/i, (res) ->
    font = ""
    cmd = res.match[1]
    switch cmd
      when "asciibasic" then font = "Basic"
      when "asciibroadway" then font = "Broadway"
      when "asciibulbhead" then font = "Bulbhead"
      when "asciicontessa" then font = "Contessa"
      when "asciidrpepper" then font = "Drpepper"
      else font = "Doom"
    text = res.match[2]
    art.font text, font, (art) ->
      res.send art
