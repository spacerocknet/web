http = require 'http'

module.exports = (env, callback) ->
  http.get { host: 'slowtheory.cloudant.com', path: '/www/photos' }, (res) ->
    data = ''
    res.on 'data', (chunk) ->
      data += chunk.toString()
    res.on 'end', () ->
      env.locals.tb = JSON.parse data
      callback()
