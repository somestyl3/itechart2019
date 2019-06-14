require_relative 'data_tree/scanner.rb'
require_relative 'data_tree/tree.rb'

class DataTree
  tree = Scanner.new
  tree.scan
end
