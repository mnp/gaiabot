# mnp
# webhook will call here to pull himself from github

module.exports = (robot) ->
    
    robot.respond /scripts version/i, (msg) ->
        try
            process.chdir '/home/mnp/myhubot/scripts'
            {spawn} = require 'child_process'
            got = spawn 'git', ['rev-parse', '--short', 'HEAD']
            got.stdout.on 'data', (data) -> msg.send "Looking in the mirror, I see " + data.toString().trim()
            got.stderr.on 'data', (data) -> msg.send "My mirror is cloudy :-( " + data.toString().trim() 
        catch error
            msg.send "git rev-parse failed: " + error
    
