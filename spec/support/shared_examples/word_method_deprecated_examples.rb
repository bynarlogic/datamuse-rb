include DatamuseRB

RSpec.shared_examples "word method deprecated examples" do |string, method, keys|
  it "returns a collection of words as DatamuseResults" do
    result = string.send(method)
    expect(result).to be_a(DatamuseRB::DatamuseResults)
    expect(result.first).to be_a(DatamuseRB::DatamuseResult)
  end

  it "returns empty if the string is blank" do
    expect("".send(method)).to be_empty
  end

  it "each entry has 3 keys - word, score, and tags" do
    result = string.send(method)
    expect(result.first.instance_variable_get("@table").keys).to eq(keys)
  end

  it "returns a deprecation notice" do
    expect{string.send(method)}.to output(/DatamuseRB Deprecation Notice:/).to_stderr
  end
end
