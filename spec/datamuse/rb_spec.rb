
RSpec.describe Datamuse::Rb do
  it "has a version number" do
    expect(Datamuse::Rb::VERSION).not_to be nil
  end

  describe "means_like" do
    it "returns a collection of words" do
      expect("ruby".means_like).to be_a(Array)
    end

    it "each entry has 3 keys - word, score, and tags" do
      result = "ruby".means_like
      expect(result.first.keys).to eq(["word","score","tags"])
    end
  end
end
