require File.expand_path(File.dirname(__FILE__) + '/spec_helper') 

describe Levenshtein do
  let(:s1_string01) { 'kitten' }
  let(:s1_string02) { 'sitting' }

  let(:s2_string01) { 'book' }
  let(:s2_string02) { 'back' } 

  let(:s3_string01) { 'table' }
  let(:s3_string02) { 'tablet' } 

  let(:s4_string01) { 'apple' }
  let(:s4_string02) { 'microsoft' } 

  let(:s5_string01) { 'levenshtein distance calculators are fun' }
  let(:s5_string02) { 'yay' } 

  let(:s6_string01) { 'Levenshtein distance is named after the Russian scientist Vladimir Levenshtein, who devised the algorithm in 1965' }
  let(:s6_string02) { 'Russia?' } 

  context "when working with identical strings" do
    let(:s1_string02) { 'kitten' }
    it "should say their distance is zero" do
      Levenshtein.distance(s1_string01, s1_string02).should == 0
    end
  end

  context "when working with different strings" do
    it "should know the distance between two strings" do
      Levenshtein.distance(s1_string01, s1_string02).should == 3
      Levenshtein.distance(s2_string01, s2_string02).should == 2
      Levenshtein.distance(s3_string01, s3_string02).should == 1
      Levenshtein.distance(s4_string01, s4_string02).should == 9
      Levenshtein.distance(s5_string01, s5_string02).should == 39
      Levenshtein.distance(s6_string01, s6_string02).should == 107
    end
  end
end
