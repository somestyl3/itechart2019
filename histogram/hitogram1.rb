require 'histogram/array'

arr = Array.new(100) do |_i|
  i = rand(100)
end

p arr.histogram(:fd)
