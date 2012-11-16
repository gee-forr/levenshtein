class Levenshtein
  VERSION = 1.0
  class << self; attr_accessor :memo end 
  @memo = {}                             

  def self.distance(first_string, second_string)
    memo_key = "#{first_string}#{second_string}"
    return @memo[memo_key] if @memo_key.has_key? memo_key 

    cost    = 0
    cost    = 1 if first_string[0] != second_string[0]
    s1_size = first_string.size
    s2_size = second_string.size

    return s2_size if s1_size == 0
    return s1_size if s2_size == 0

    [ # return the lowest value out of these three calls
      distance(first_string[1..s1_size-1], second_string) + 1,
      distance(first_string, second_string[1..s2_size-1]) + 1,
      distance(first_string[1..s1_size-1], second_string[1..s2_size-1]) + cost
    ].min
  end
end
