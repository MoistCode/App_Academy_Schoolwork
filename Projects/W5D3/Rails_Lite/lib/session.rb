require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  attr_reader :req

  def initialize(req)
    @req = req
    @cookies = @req.cookies
  end

  def [](key)
  end

  def []=(key, val)
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    debugger
  end
end
