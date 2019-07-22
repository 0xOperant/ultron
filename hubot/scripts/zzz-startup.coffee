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
  MESSAGE = "*#{robot.name} is online* :robot_face:" 
 
  robot.messageRoom ROOM, MESSAGE
