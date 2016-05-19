require 'http'
require 'json'
require 'faye/websocket'
require 'eventmachine'


rc = HTTP.post("https://slack.com/api/rtm.start", params: {
  token: ENV['SHIELD_SLACKBOT_KEY']
  })

rc = JSON.parse(rc.body)

url = rc['url']

EM.run do
  ws = Faye::WebSocket::Client.new(url)

  ws.on :open do
    p [:open]
  end

  ws.on :message do |event|
    p [:message, JSON.parse(event.data)]
  end

  ws.on :close do |event|
    p [:close, event.code, event.rc]
    ws = nil
    EM.stop
  end

end
