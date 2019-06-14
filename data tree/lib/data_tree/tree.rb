require 'parallel'

class Tree
  def make_tree(path_arr, root)
    tree_data = path_arr
    tree_hash = {}
    branch = '├── '
    pipe = '│   '
    leaf = '└── '
    space = '    '
    tree_data.sort!
    i = tree_data.length
    while i != 1
      i -= 1
      level = tree_data[i].to_s.count('/') - root.to_s.count('/')
      tree_hash[i] = []
      if level == 1
        tree_hash[i] << branch
        tree_hash[i] << File.basename(tree_data[i])
      else
        tree_hash[i] << space
        (level - 2).times { tree_hash[i] << space }
        tree_hash[i] << branch
        tree_hash[i] << File.basename(tree_data[i])
      end
      (0..tree_hash[i].size).each do |index|
        if tree_hash[i + 1].nil? && tree_hash[i][index] == branch
          tree_hash[i][index] = leaf
        elsif tree_hash[i + 1].nil?
          next
        elsif tree_hash[i][index] == space &&
              (tree_hash[i + 1][index] == branch ||
               tree_hash[i + 1][index] == pipe ||
               tree_hash[i + 1][index] == leaf)
          tree_hash[i][index] = pipe
        elsif tree_hash[i][index] == branch &&
              (tree_hash[i + 1][index] != branch &&
              tree_hash[i + 1][index] != pipe &&
              tree_hash[i + 1][index] != leaf)
          tree_hash[i][index] = leaf
        end
      end
    end
    puts root
    tree_hash = tree_hash.each.sort_by { |k, _v| k }
    tree_hash.each { |_k, v| puts v.join }
  end
end
