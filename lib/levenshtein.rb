class Levenshtein
  VERSION = 1.0
  class << self; attr_accessor :memo end 
  @memo = {}                             

  def self.distance(first_string, second_string)
    memo_key = "#{first_string}#{second_string}"
    return @memo[memo_key] if @memo.has_key? memo_key 

    cost    = 0
    cost    = 1 if first_string[0] != second_string[0]
    s1_size = first_string.size
    s2_size = second_string.size

    return s2_size if s1_size == 0
    return s1_size if s2_size == 0

    [ {strs: [first_string[1..s1_size-1], second_string], cost: 1},
      {strs: [first_string, second_string[1..s2_size-1]], cost: 1},
      {strs: [first_string[1..s1_size-1], second_string[1..s2_size-1]], cost: cost}
    ].map do |attempt|
      dist       = distance(attempt[:strs][0], attempt[:strs][1])
      key        = "#{attempt[:strs][0]}#{attempt[:strs][1]}"
      @memo[key] = dist

      dist + attempt[:cost]
    end.min
  end
end
