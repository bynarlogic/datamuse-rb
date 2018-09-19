require "datamuse/rb/version"
require 'httparty'
require 'ostruct'

module DatamuseRB

class DatamuseRequest
  include HTTParty
  base_uri "api.datamuse.com"

  def self.send(endpoint,**queries)
    response = get(endpoint,query: queries)
    response.parsed_response.map {|r| OpenStruct.new(r)}
  end
end

WORD_METHODS = {means_like: :ml, sounds_like: :sl, spelled_like: :sp, related_popular_nouns: :rel_jja, related_popular_adjectives: :rel_jjb, related_synonyms: :rel_syn, related_triggers: :rel_trg, related_antonyms: :rel_ant}

end

class String
  include DatamuseRB

  def method_missing(name)
    super unless WORD_METHODS[name]
    DatamuseRequest.send("/words",{WORD_METHODS[name] => self})
  end

end
