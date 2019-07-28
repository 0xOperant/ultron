# Description: 
#   A Hubot script that tells sends a message on startup. 
# 
# Dependencies:
#   None
#
# Configuration: 
#   None 
# 
# Commands: 
#   None 
#
# Notes:
#   None
#
# Author: 
#   0xoperant 
 
module.exports = (robot) -> 
  ROOM = "#daves_bots" 
  MESSAGE = "https://media.giphy.com/media/yj5UdA4elp8Wc/giphy.gif" 
 
  robot.messageRoom ROOM, MESSAGE
