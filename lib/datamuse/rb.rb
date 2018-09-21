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

  def method_missing(name)
    super unless WORD_METHODS[name]
    DatamuseRequest.send("/words",{WORD_METHODS[name] => self})
  end

end
