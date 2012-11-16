require File.expand_path(File.dirname(__FILE__) + '/spec_helper') 

describe Levenshtein do
  let(:s1_string01) { 'kitten' }
  let(:s1_string02) { 'sitting' }

  let(:s2_string01) { 'book' }
  let(:s2_string02) { 'back' } 

  let(:s3_string01) { 'table' }
  let(:s3_string02) { 'tablet' } 

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
    end
  end
end
