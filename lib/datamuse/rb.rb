require "datamuse/rb/version"
require 'httparty'

class DatamuseRequest
  include HTTParty
  base_uri "api.datamuse.com"

  def self.send(endpoint,**queries)
    response = get(endpoint,query: queries)
    response.parsed_response
  end
end

class String
  def means_like
    r = DatamuseRequest.send("/words",{ml: self})
  end
end
