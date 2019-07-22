# Description:
#   These are based on the scripting documentation
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Notes:
#   None
#
# Author:
#   0xoperant
 
module.exports = (robot) -> 
 
#respond to greetings 
   greets = ['hi', 'hello', 'oh hai', 'hey there', 'sup', 'greetz', 'yo', 'what up'] 
   robot.respond /welcome|hello|sup|hey|hi/i, (res) -> 
     res.reply res.random greets 
 
#listen for "badger" and post to channel 
   robot.hear /badger/i, (res) -> 
     res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS" 
 
#listen for "to myself" and reply (i.e. "just talking to myself" 
   robot.hear /to myself/i, (res) -> 
     res.reply "I still love you ;)" 
 
#bakes pie 
   robot.hear /pie/i, (res) -> 
     res.emote "/me makes a freshly baked pie :pie:" 
 
#joins in the lols 
   lulz = ['lol', 'rofl', 'lmao', 'lulz', 'heh', 'ha', 'l o l'] 
 
   robot.listen( 
    (message) -> 
      return false unless message.text 
      match = message.match /ha|heh|lulz|lol|lmao|l o l|rofl/i 
      if match? and Math.random() > 0.9 
        return true 
      else 
        return false 
    (response) -> 
      response.send response.random lulz 
   ) 
 
#snarky response to topic changes 
   robot.topic (res) -> 
     res.send "#{res.message.text}? Well this should be good...'" 
 
#respond when people enter/leave a channel 
   enterReplies = ['Hi there.', 'Target Acquired!', 'Fire one!', 'Hello friend.', 'Gotch!', 'I see you now...'] 
   leaveReplies = ['Are you still there? Hello?', 'Target lost', 'Searching for target...'] 
 
   robot.enter (res) -> 
     res.send res.random enterReplies 
   robot.leave (res) -> 
     res.send res.random leaveReplies 
 
