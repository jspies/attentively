require 'faraday'

module Attentively
  class Request
    LIVE_HOST = "https://api.attentive.ly"
    TEST_HOST = "http://apidev.attentive.ly"

    attr_accessor :test, :uri, :access_token

    def initialize(uri:, access_token:, test: false)
      self.test = test
      self.uri = uri
      self.access_token = access_token
    end

    def post(params)
      response = connection.post do |request|
        request.body = params.merge(access_token: access_token)
      end

      if response.status == 200
        response_json = JSON.parse(response.body)
        return response_json['posts']
      end
      
      {error: response.status}
    end

    private

      def endpoint
        "#{test ? TEST_HOST : LIVE_HOST}/#{self.uri}"
      end

      def connection
        @conn ||= Faraday.new(url: endpoint) do |faraday|
          faraday.ssl_version = :SSLv3
          faraday.request  :url_encoded
          faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end
      end
  end
end