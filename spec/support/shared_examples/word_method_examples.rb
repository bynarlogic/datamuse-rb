include DatamuseRB

RSpec.shared_examples "word method examples" do |string, method, keys|
  it "returns a collection of words as DatamuseResults" do
    result = string.send(method)
    expect(result).to be_a(DatamuseResults)
    expect(result.first).to be_a(DatamuseResult)
  end

  it "returns empty if the string is blank" do
    expect("".send(method)).to be_empty
  end

  it "each entry has 3 keys - word, score, and tags" do
    result = string.send(method)
    expect(result.first.instance_variable_get("@table").keys).to eq(keys)
  end
end
