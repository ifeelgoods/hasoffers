require File.dirname(__FILE__) + '/test_helper'

class ResponseTest < Test::Unit::TestCase

  class FakeHttpResponse
    attr_reader :code, :message, :body

    def initialize(code, message, body=nil)
      @code = code
      @message = message
      @body = body
    end

    def to_hash
      Hash.new
    end
  end

  def test_parse_succesfull_response

    http_resp = FakeHttpResponse.new('200','Found',  %q(
     {
       "response": {
         "data": { },
         "errors": [ ],
         "status": 1
       }
     }
    ))

    response = HasOffers::Response.new(http_resp)

    assert_equal(response.success?, true)
  end

  def test_parse_error_response
    http_resp = FakeHttpResponse.new('500','Internal server error')

    response = HasOffers::Response.new(http_resp)

    assert_equal(response.success?, false)
    assert_equal(response.body['response']['errors'], '500 Internal server error')
  end
end
