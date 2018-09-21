
RSpec.describe Datamuse::Rb do
  it "has a version number" do
    expect(Datamuse::Rb::VERSION).not_to be nil
  end

  describe "means_like" do
    include_examples "word method examples", "ruby", "means_like", [:word,:score, :tags]

    it "returns empty if the word is not in datamuse" do
      expect("jkl;asdf".means_like).to be_empty
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
end
