require File.expand_path(File.dirname(__FILE__) + '/spec_helper') 

describe Levenshtein do
  let(:first_string)  { 'kitten' }
  let(:second_string) { 'sitting' }

  context "when working with identical strings" do
    let(:second_string) { 'kitten' }
    it "should say their distance is zero" do
      Levenshtein.distance(first_string, second_string).should == 0
    end
  end

  context "when working with different strings" do
    it "should know the distance between two strings" do
      Levenshtein.distance(first_string, second_string).should == 3
    end
  end
end
