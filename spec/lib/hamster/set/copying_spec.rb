require "hamster/set"

RSpec.describe Hamster::Set do
  [:dup, :clone].each do |method|
    describe "##{method}" do
      let(:set) { S["A", "B", "C"] }

      it "returns self" do
        expect(set.send(method)).to equal(set)
      end
    end
  end
end
