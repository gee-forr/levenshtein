require File.expand_path(File.dirname(__FILE__) + '/spec_helper') 
require 'pry'

describe Levenshtein do
  strings = [
    # Short strings
    {strs: ['kitten', 'sitting'],  distance: 3},
    {strs: ['book', 'back'],       distance: 2},
    {strs: ['table', 'tablet'],    distance: 1},
    {strs: ['apple', 'microsoft'], distance: 9},

    # Long strings
    {strs: ['levenshtein distance calculators are fun', 'yay'], distance: 39},
    {strs: ['Levenshtein distance is named after the Russian scientist Vladimir Levenshtein, who devised the algorithm in 1965', 'Russia?'], distance: 107},
  ]

  context "when working with identical strings" do
    it "should say their distance is zero" do
      strings.each do |s|
        str = s[:strs][0]
        Levenshtein.distance(str, str).should == 0
      end
    end
  end

  context "when working with different strings" do
    it "should know the distance between two strings" do
      strings.each do |s|
        s_str    = s[:strs][0]
        t_str    = s[:strs][1]
        distance = s[:distance]
        Levenshtein.distance(s_str, t_str).should == distance
      end
    end
  end
end
