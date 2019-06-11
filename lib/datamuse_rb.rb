require "datamuse_rb/version"
require 'httparty'
require 'ostruct'

module DatamuseRB

  class DatamuseRequest
    include HTTParty
    base_uri "api.datamuse.com"

    def self.send(endpoint,**queries)
      response = get(endpoint,query: queries)
      DatamuseResults.new(response.parsed_response,queries)
    end
  end

  class DatamuseResult < OpenStruct
  end

  class DatamuseResults
    include Enumerable

    def initialize(response, query)
      @results = response.map {|r| DatamuseResult.new(r)}
      @query = query
    end

    def each(&block)
      @results.each do |result|
        block.call(result)
      end
    end

    def empty?
      none?
    end

    private

    def method_missing(name,*args)
      super unless WORD_METHODS[name] && args.any?
      @query.merge! WORD_METHODS[name] => args.first
      DatamuseRequest.send("/words",@query)
    end

    attr_reader :results, :query

  end

  WORD_METHODS = {
    means_like: :ml, sounds_like: :sl, spelled_like: :sp, related_popular_nouns: :rel_jja,
    related_popular_adjectives: :rel_jjb, related_synonyms: :rel_syn, related_triggers: :rel_trg,
    related_antonyms: :rel_ant, kind_of_hyponyms: :rel_spc, general_hyponyms: :rel_gen,
    comporomise_hyponyms: :rel_com, part_of_meronyms: :rel_par, frequent_followers: :rel_bga,
    frequent_predecessors: :rel_bgb, related_rhymes: :rel_rhy, approximate_rhymes: :rel_nry,
    related_homophones: :rel_hom,consonant_match: :rel_cns
  }

  refine String do
    WORD_METHODS.each do |k,v|
      define_method(k) do
        DatamuseRequest.send("/words",v => self)
      end
    end
  end

  def warning_message
    <<~HEREDOC
      DatamuseRB Deprecation Notice: 
      String will no longer be globally extended starting in version 0.2.0.
      Add 'using DatamuseRB' to the module or class that uses this behavior. 
      For further details visit https://github.com/bynarlogic/datamuse-rb
    HEREDOC
  end

end

class String
  include DatamuseRB
  WORD_METHODS.each do |k,v|
    define_method(k) do
      warn(warning_message)
      DatamuseRequest.send("/words",v => self)
    end
  end
end



