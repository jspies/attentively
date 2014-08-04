require "attentively/version"
require "attentively/request"

module Attentively
  class Api
    attr_accessor :access_token

    def initialize(access_token:, test: false)
      self.access_token = access_token
    end

    def posts(term)
      request = Attentively::Request.new(uri: "/posts", access_token: access_token, test: false)
      request.post({term: term})
    end
  end
end
