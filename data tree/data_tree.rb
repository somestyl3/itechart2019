Dir.glob('**/*').map { |path| path.split '/' }.each_with_object({}) do |acc, path|
  path.inject(acc) do |acc2, dir|
    acc2[dir] ||= {}
  end
  data_hash = acc.reverse.inject { |a, n| { n => a } }
  puts data_hash
end
