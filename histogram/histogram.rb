data = Array.new(100) { rand(100) }

module Enumerable
  def to_histogram
    each_with_object(Hash.new(0)) { |v, k| k[v] += 1; }
  end
end

puts data.to_histogram
