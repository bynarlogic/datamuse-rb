
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

 # describe "related_word(word)" do
 #   it "returns a collection of words as openstructs" do
 #     result = "ruby".spelled_like
 #     expect(result).to be_a(Array)
 #     expect(result.first).to be_a(OpenStruct)
 #   end

 #   it "returns empty if the word is not in datamuse" do
 #     expect("jkl;asdf".spelled_like).to be_empty
 #   end

 #   it "returns empty if the string is blank" do
 #     expect("".spelled_like).to be_empty
 #   end

 #   it "each entry has 2 keys - word and score" do
 #     result = "ruby".spelled_like
 #     expect(result.first.instance_variable_get("@table").keys).to include(:word,:score)
 #   end
 # end
end
