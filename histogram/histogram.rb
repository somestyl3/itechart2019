data = Array.new(100) do |i| #test
    i = rand(100)
  end 

module Enumerable
    def to_histogram
      inject(Hash.new(0)) { |k, v| k[v] += 1; k }
    end
end

puts data.to_histogram
