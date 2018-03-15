require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  attr_reader :req

  def initialize(req)
    @req = req
    cookie = req.cookies['_rails_lite_app']
    if cookie
      @session = JSON.parse(cookie)
    else
      @session = {}
    end
  end

  def [](key)
    @session[key]
  end

  def []=(key, val)
    @session[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res['_rails_lite_app'] = @session
  end

end
