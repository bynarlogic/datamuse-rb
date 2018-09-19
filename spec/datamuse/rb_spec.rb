
RSpec.describe Datamuse::Rb do
  it "has a version number" do
    expect(Datamuse::Rb::VERSION).not_to be nil
  end

  describe "means_like" do
    it "returns a collection of words as openstructs" do
      result = "ruby".means_like
      expect(result).to be_a(Array)
      expect(result.first).to be_a(OpenStruct)
    end

    it "returns empty if the word is not in datamuse" do
      expect("jkl;asdf".means_like).to be_empty
    end

    it "returns empty if the string is blank" do
      expect("".means_like).to be_empty
    end

    it "each entry has 3 keys - word, score, and tags" do
      result = "ruby".means_like
      expect(result.first.instance_variable_get("@table").keys).to include(:word,:score,:tags)
    end
  end


  describe "sounds_like" do
    it "returns a collection of words as openstructs" do
      result = "ruby".sounds_like
      expect(result).to be_a(Array)
      expect(result.first).to be_a(OpenStruct)
    end

    it "returns empty if the string is blank" do
      expect("".sounds_like).to be_empty
    end

    it "each entry has 3 keys - word, score, and numSyllables" do
      result = "ruby".sounds_like
      expect(result.first.instance_variable_get("@table").keys).to include(:word,:score,:numSyllables)
    end
  end

  describe "spelled_like" do
    it "returns a collection of words as openstructs" do
      result = "ruby".spelled_like
      expect(result).to be_a(Array)
      expect(result.first).to be_a(OpenStruct)
    end

    it "returns empty if the word is not in datamuse" do
      expect("jkl;asdf".spelled_like).to be_empty
    end

    it "returns empty if the string is blank" do
      expect("".spelled_like).to be_empty
    end

    it "each entry has 2 keys - word and score" do
      result = "ruby".spelled_like
      expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
    end
  end

 describe "related_popular_nouns" do
   it "returns a collection of words as openstructs" do
     result = "ruby".related_popular_nouns
     expect(result).to be_a(Array)
     expect(result.first).to be_a(OpenStruct)
   end

   it "returns empty if the word is not in datamuse" do
     expect("jkl;asdf".related_popular_nouns).to be_empty
   end

   it "returns empty if the string is blank" do
     expect("".related_popular_nouns).to be_empty
   end

   it "each entry has 2 keys - word and score" do
     result = "ruby".related_popular_nouns
     expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
   end
 end

 describe "related_popular_adjectives" do
   it "returns a collection of words as openstructs" do
     result = "ruby".related_popular_adjectives
     expect(result).to be_a(Array)
     expect(result.first).to be_a(OpenStruct)
   end

   it "returns empty if the word is not in datamuse" do
     expect("jkl;asdf".related_popular_adjectives).to be_empty
   end

   it "returns empty if the string is blank" do
     expect("".related_popular_adjectives).to be_empty
   end

   it "each entry has 2 keys - word and score" do
     result = "ruby".related_popular_adjectives
     expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
   end
 end

 describe "related_synonyms" do
   it "returns a collection of words as openstructs" do
     result = "ruby".related_synonyms
     expect(result).to be_a(Array)
     expect(result.first).to be_a(OpenStruct)
   end

   it "returns empty if the word is not in datamuse" do
     expect("jkl;asdf".related_synonyms).to be_empty
   end

   it "returns empty if the string is blank" do
     expect("".related_synonyms).to be_empty
   end

   it "each entry has 2 keys - word and score" do
     result = "ruby".related_synonyms
     expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
   end
 end

 describe "related_triggers" do
   it "returns a collection of words as openstructs" do
     result = "ruby".related_triggers
     expect(result).to be_a(Array)
     expect(result.first).to be_a(OpenStruct)
   end

   it "returns empty if the word is not in datamuse" do
     expect("jkl;asdf".related_triggers).to be_empty
   end

   it "returns empty if the string is blank" do
     expect("".related_triggers).to be_empty
   end

   it "each entry has 2 keys - word and score" do
     result = "ruby".related_triggers
     expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
   end
 end

 describe "related_antonyms" do
   it "returns a collection of words as openstructs" do
     result = "late".related_antonyms
     expect(result).to be_a(Array)
     expect(result.first).to be_a(OpenStruct)
   end

   it "returns empty if the word is not in datamuse" do
     expect("jkl;asdf".related_antonyms).to be_empty
   end

   it "returns empty if the string is blank" do
     expect("".related_antonyms).to be_empty
   end

   it "each entry has 2 keys - word and score" do
     result = "late".related_antonyms
     expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
   end
 end
end
