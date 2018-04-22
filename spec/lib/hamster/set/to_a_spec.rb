require "hamster/set"

RSpec.describe Hamster::Set do
  [:to_a, :entries].each do |method|
    describe "##{method}" do
      ('a'..'z').each do |letter|
        context "on 'a'..'#{letter}'" do
          let(:values) { ('a'..letter).to_a }
          let(:set) { S.new(values) }
          let(:result) { set.send(method) }

          it "returns an equivalent array" do
            expect(result.sort).to eq(values.sort)
          end

          it "doesn't change the original Set" do
            result
            expect(set).to eql(S[*values])
          end

          it "returns a mutable array" do
            expect(result.last).to_not eq("The End")
            result << "The End"
            expect(result.last).to eq("The End")
          end
        end
      end
    end
  end
end
