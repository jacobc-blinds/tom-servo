# Description:
#   Get ASCII art from text.
#
# Dependencies:
#   "figlet": "^1.1.1",
#
# Configuration:
#   None
#
# Commands:
#   hubot ascii <your text> - Get ASCII art from text (default "Doom" font)
#   hubot asciifont [<font name>] <your text> - Get ASCII art from text with font argument
#   hubot asciifonts - Get available ASCII art fonts
#
# Author:
#   Buddy Toups
figlet = require('figlet')

module.exports = (robot) ->
  robot.respond /ascii\s(.*)/i, (res) ->
    font = "Doom"
    text = res.match[1]
    figlet.text text, {
      font: font
      horizontalLayout: 'default'
      verticalLayout: 'default'
    }, (err, data) ->
      if err
        res.send 'Sorry no ASCII Art for you :('
        return
      res.send '```'+data+'```'
      return
  robot.respond /asciifont\s\[(.+)\]\s(.*)/i, (res) ->
    font = res.match[1]
    text = res.match[2]
    figlet.text text, {
      font: font
      horizontalLayout: 'default'
      verticalLayout: 'default'
    }, (err, data) ->
      if err
        res.send 'Sorry no ASCII Art for you (use `servo asciifonts` to get a list of available fonts)'
        return
      res.send '```'+data+'```'
      return
  robot.respond /asciifonts/i, (res) ->
    res.send "[1Row]\n[3-D]\n[3D Diagonal]\n[3D-ASCII]\n[3x5]\n[4Max]\n[5 Line Oblique]\n[AMC 3 Line]\n[AMC 3 Liv1]\n[AMC AAA01]\n[AMC Neko]\n[AMC Razor]\n[AMC Razor2]\n[AMC Slash]\n[AMC Slider]\n[AMC Thin]\n[AMC Tubes]\n[AMC Untitled]\n[ANSI Shadow]\n[ASCII New Roman]\n[Acrobatic]\n[Alligator]\n[Alligator2]\n[Alpha]\n[Alphabet]\n[Arrows]\n[Avatar]\n[B1FF]\n[Banner]\n[Banner3-D]\n[Banner3]\n[Banner4]\n[Barbwire]\n[Basic]\n[Bear]\n[Bell]\n[Benjamin]\n[Big Chief]\n[Big Money-ne]\n[Big Money-nw]\n[Big Money-se]\n[Big Money-sw]\n[Big]\n[Bigfig]\n[Binary]\n[Block]\n[Blocks]\n[Bloody]\n[Bolger]\n[Braced]\n[Bright]\n[Broadway KB]\n[Broadway]\n[Bubble]\n[Bulbhead]\n[Caligraphy]\n[Caligraphy2]\n[Calvin S]\n[Cards]\n[Catwalk]\n[Chiseled]\n[Chunky]\n[Coinstak]\n[Cola]\n[Colossal]\n[Computer]\n[Contessa]\n[Contrast]\n[Cosmike]\n[Crawford]\n[Crawford2]\n[Crazy]\n[Cricket]\n[Cursive]\n[Cyberlarge]\n[Cybermedium]\n[Cybersmall]\n[Cygnet]\n[DANC4]\n[DOS Rebel],\n[DWhistled]\n[Dancing Font]\n[Decimal]\n[Def Leppard]\n[Delta Corps Priest 1]\n[Diamond]\n[Diet Cola]\n[Digital]\n[Doh]\n[Doom]\n[Dot Matrix]\n[Double Shorts]\n[Double]\n[Dr Pepper]\n[Efti Chess]\n[Efti Font]\n[Efti Italic]\n[Efti Piti]\n[Efti Robot]\n[Efti Wall]\n[Efti Water]\n[Electronic]\n[Elite]\n[Epic]\n[Fender]\n[Filter]\n[Fire Font-k]\n[Fire Font-s]\n[Flipped]\n[Flower Power]\n[Four Tops]\n[Fraktur]\n[Fun Face]\n[Fun Faces]\n[Fuzzy]\n[Georgi16]\n[Georgia11]\n[Ghost]\n[Ghoulish]\n[Glenyn]\n[Goofy]\n[Gothic]\n[Graceful]\n[Gradient]\n[Graffiti]\n[Greek]\n[Heart Left]\n[Heart Right]\n[Henry 3D]\n[Hex]\n[Hieroglyphs]\n[Hollywood]\n[Horizontal Left]\n[Horizontal Right]\n[ICL-1900]\n[Impossible]\n[Invita]\n[Isometric1]\n[Isometric2]\n[Isometric3]\n[Isometric4]\n[Italic]\n[Ivrit]\n[JS Block Letters]\n[JS Bracket Letters]\n[JS Capital Curves]\n[JS Cursive]\n[JS Stick Letters]\n[Jacky]\n[Jazmine]\n[Jerusalem]\n[Katakana]\n[Kban]\n[Keyboard]\n[Knob]\n[Konto Slant]\n[Konto]\n[LCD]\n[Larry 3D 2]\n[Larry 3D]\n[Lean]\n[Letters]\n[Lil Devil]\n[Line Blocks]\n[Linux]\n[Lockergnome]\n[Madrid]\n[Marquee]\n[Maxfour]\n[Merlin1]\n[Merlin2]\n[Mike]\n[Mini]\n[Mirror]\n[Mnemonic]\n[Modular]\n[Morse]\n[Morse2]\n[Moscow]\n[Mshebrew210]\n[Muzzle]\n[NScript]\n[NT Greek]\n[NV Script]\n[Nancyj-Fancy]\n[Nancyj-Improved]\n[Nancyj-Underlined]\n[Nancyj]\n[Nipples]\n[O8]\n[OS2]\n[Octal]\n[Ogre]\n[Old Banner]\n[Patorjk's Cheese]\n[Patorjk-HeX]\n[Pawp]\n[Peaks Slant]\n[Peaks]\n[Pebbles]\n[Pepper]\n[Poison]\n[Puffy]\n[Puzzle]\n[Pyramid]\n[Rammstein]\n[Rectangles]\n[Red Phoenix]\n[Relief]\n[Relief2]\n[Reverse]\n[Roman]\n[Rot13]\n[Rotated]\n[Rounded]\n[Rowan Cap]\n[Rozzo]\n[Runic]\n[Runyc]\n[S Blood]\n[SL Script]\n[Santa Clara]\n[Script]\n[Serifcap]\n[Shadow]\n[Shimrod]\n[Short]\n[Slant Relief]\n[Slant]\n[Slide]\n[Small Caps]\n[Small Isometric1]\n[Small Keyboard]\n[Small Poison]\n[Small Script]\n[Small Shadow]\n[Small Slant]\n[Small Tengwar]\n[Small]\n[Soft]\n[Speed]\n[Spliff]\n[Stacey]\n[Stampate]\n[Stampatello]\n[Standard]\n[Star Strips]\n[Star Wars]\n[Stellar]\n[Stforek]\n[Stick Letters]\n[Stop]\n[Straight]\n[Stronger Than All]\n[Sub-Zero]\n[Swamp Land]\n[Swan]\n[Sweet]\n[THIS]\n[Tanja]\n[Tengwar]\n[Term]\n[Test1]\n[The Edge]\n[Thick]\n[Thin]\n[Thorned]\n[Three Point]\n[Ticks Slant]\n[Ticks]\n[Tiles]\n[Tinker-Toy]\n[Tombstone]\n[Train]\n[Trek]\n[Tsalagi]\n[Tubular]\n[Twisted]\n[Two Point]\n[USA Flag]\n[Univers]\n[Varsity]\n[Wavy]\n[Weird]\n[Wet Letter]\n[Whimsy]\n[Wow]"
    return