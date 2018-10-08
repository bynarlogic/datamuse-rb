include DatamuseRB

RSpec.describe DatamuseRB do
  it "has a version number" do
    expect(DatamuseRB::VERSION).not_to be nil
  end

  describe "word methods" do
    describe "means_like" do
      include_examples "word method examples", "ruby", "means_like", [:word,:score, :tags]

      it "returns empty if the word is not in datamuse" do
        expect("jkl;asdf".means_like.results).to be_empty
      end
    end

    describe "sounds_like" do
      include_examples "word method examples", "ruby", "sounds_like", [:word,:score, :numSyllables]
    end

    describe "spelled_like" do
      include_examples "word method examples", "ruby", "spelled_like", [:word,:score]
    end

    describe "related_popular_nouns" do
      include_examples "word method examples", "ruby", "related_popular_nouns", [:word,:score]
    end

    describe "related_popular_adjectives" do
      include_examples "word method examples", "ruby", "related_popular_adjectives", [:word,:score]
    end

    describe "related_synonyms" do
      include_examples "word method examples", "ruby", "related_synonyms", [:word,:score]
    end

    describe "related_triggers" do
      include_examples "word method examples", "ruby", "related_triggers", [:word,:score]
    end

    describe "related_antonyms" do
      include_examples "word method examples", "late", "related_antonyms", [:word,:score]
    end

    describe "kind_of_hyponyms" do
      include_examples "word method examples", "gondola", "kind_of_hyponyms", [:word,:score]
    end

    describe "general_hyponyms" do
      include_examples "word method examples", "boat", "general_hyponyms", [:word,:score]
    end

    describe "comporomise_hyponyms" do
      include_examples "word method examples", "car", "comporomise_hyponyms", [:word,:score]
    end

    describe "part_of_meronyms" do
      include_examples "word method examples", "car", "part_of_meronyms", [:word,:score]
    end

    describe "frequent_followers" do
      include_examples "word method examples", "wreak", "frequent_followers", [:word,:score]
    end

    describe "frequent_predecessors" do
      include_examples "word method examples", "havoc", "frequent_predecessors", [:word,:score]
    end

    describe "related_rhymes" do
      include_examples "word method examples", "aid", "related_rhymes", [:word,:score, :numSyllables]
    end

    describe "approximate_rhymes" do
      include_examples "word method examples", "forest", "approximate_rhymes", [:word,:score, :numSyllables]
    end

    describe "related_homophones" do
      include_examples "word method examples", "course", "related_homophones", [:word,:score, :numSyllables]
    end

    describe "consonant_match" do
      include_examples "word method examples", "sample", "consonant_match", [:word,:score, :numSyllables]
    end
  end

  describe "chaining methods" do
    it "returns a DatamuseResults object containing DatamuseResult objects" do
      expect("ruby".means_like.related_rhymes("stem")).to be_a(DatamuseResultList)
      expect("ruby".means_like.related_rhymes("stem").results.first).to be_a(DatamuseResult)
    end
  end
end
