require 'pathname'
class Scanner
  def scan(root = Dir.pwd)
    path_arr = []
    root = Pathname.new(root)
    root.find { |v| path_arr << v }
    Tree.new.make_tree(path_arr, root)
  end
end
