require 'http'
require 'json'
require 'faye-websocket'
require 'eventmachine'

rc = HTTP.post("https://slack.com/api/rtm.start", params: {
  token: ENV['SHIELD_SLACKBOT_KEY'],
  channel: '#general',
  text: 'hello from me',
  as_user: true
  })
puts JSON.pretty_generate(JSON.parse(rc.body))
