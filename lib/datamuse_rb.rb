require "datamuse_rb/version"
require 'httparty'
require 'ostruct'

module DatamuseRB

  class DatamuseRequest
    include HTTParty
    base_uri "api.datamuse.com"

    def self.send(endpoint,**queries)
      response = get(endpoint,query: queries)
      DatamuseResultList.new(response.parsed_response)
    end
  end

  class DatamuseResultList
    extend Forwardable
    attr_accessor :results
    delegate [:first, :each] => :@results

    def initialize(response)
      @results = response.map {|r| DatamuseResult.new(r)}
    end

    def method_missing(name,*args)
      super unless WORD_METHODS[name] && args.first
      DatamuseRequest.send("/words",{WORD_METHODS[name] => args.first})
    end
  end

  class DatamuseResult < OpenStruct
  end

  WORD_METHODS = {
    means_like: :ml, sounds_like: :sl, spelled_like: :sp, related_popular_nouns: :rel_jja,
    related_popular_adjectives: :rel_jjb, related_synonyms: :rel_syn, related_triggers: :rel_trg,
    related_antonyms: :rel_ant, kind_of_hyponyms: :rel_spc, general_hyponyms: :rel_gen,
    comporomise_hyponyms: :rel_com, part_of_meronyms: :rel_par, frequent_followers: :rel_bga,
    frequent_predecessors: :rel_bgb, related_rhymes: :rel_rhy, approximate_rhymes: :rel_nry,
    related_homophones: :rel_hom,consonant_match: :rel_cns
  }

end

class String
  include DatamuseRB

  WORD_METHODS.each do |k,v|
    define_method(k) do
      DatamuseRequest.send("/words",v => self)
    end
  end

end
