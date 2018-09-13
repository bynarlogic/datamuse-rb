require "datamuse/rb/version"
require 'httparty'
require 'ostruct'

class DatamuseRequest
  include HTTParty
  base_uri "api.datamuse.com"

  def self.send(endpoint,**queries)
    response = get(endpoint,query: queries)
    response.parsed_response.map {|r| OpenStruct.new(r)}
  end
end

class String
  def means_like
    DatamuseRequest.send("/words",{ml: self})
  end

  def sounds_like
    DatamuseRequest.send("/words",{sl: self})
  end

  def spelled_like
    DatamuseRequest.send("/words",{sp: self})
  end
end
