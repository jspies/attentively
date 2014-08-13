require "attentively/version"
require "attentively/request"

module Attentively
  class Api
    attr_accessor :access_token, :test

    def initialize(access_token:, test: false)
      self.access_token = access_token
      self.test = test
    end

    def posts(term)
      request = Attentively::Request.new(uri: "/posts", access_token: access_token, test: test_mode?)
      respond(request.post({term: term}), 'posts')
    end

    def watched_terms
      request = Attentively::Request.new(uri: "/watched_terms", access_token: access_token, test: test_mode?)
      respond(request.post, 'watched_terms')
    end

    def test_mode?
      test
    end

    private
      def respond(response, object)
        if response[:error]
          return response[:error]
        else
          response[object]
        end
      end
  end
end
