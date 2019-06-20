require_relative 'data_tree/scanner.rb'
require_relative 'data_tree/tree.rb'

class DataTree
  attr_reader :path

  def initialize(path = Dir.pwd)
    @path = path
  end
end
