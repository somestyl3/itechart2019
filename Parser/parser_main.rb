require 'open-uri'
require 'nokogiri'
require 'yaml'

class Parser
  def initialize(url)
    if url =~ URI::DEFAULT_PARSER.make_regexp
      @url = url
      parse(@url)
    else
      puts 'Your url is not valid'
    end
  end

  def parse(_url)
    doc = Nokogiri::HTML(open(@url))

    links = doc.css('a')
    url = links.map { |u| u['href'] }
    title = links.map { |t| t['title'] }
    content = links.map(&:text)

    data = []
    parsed = Hash.new(0)
    links.each_with_index do |_link, index|
      data[index] = ["-URL: '#{url[index]}'\n -TITLE: '#{title[index]}' \
      -CONTENT: '#{content[index]}'"]
      parsed[index] = data[index]
      puts parsed[index]
    end
    Saver.new(parsed)
  end
end

class Saver
  def initialize(args)
    File.open('parsed_data.yaml', 'w') { |file| file.write args.to_yaml }
    puts 'Saved to file'
  end
end
P = Parser.new('https://en.wikipedia.org/wiki/Nokogiri_(software)')
