require 'open-uri'
require 'nokogiri'
require 'yaml'

class Parser
  def initialize(url)
    if url == 'https://en.wikipedia.org/wiki/Nokogiri_(software)'
      @url = url
      parse(@url)
    else
      puts 'Your url is not valid'
    end
  end

  def parse(*)
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def find
    links = @doc.css('a')
    url = links.map { |u| u['href'] }
    title = links.map { |t| t['title'] }
    content = links.map(&:text)
  end

  def save
    data = []
    parsed = Hash.new(0)
    links.each_with_index do |_link, index|
      data[index] = ["'#{url[index]}'\n'#{title[index]}'\n'#{content[index]}'"]
      parsed[index] = data[index]
      puts parsed[index]
    end
    Saver.new(parsed)
  end
end

class Saver
  def initialize(args)
    File.write('parsed_data.yaml', 'w') do |file|
      file.write args.to_yaml
      puts 'Saved to file'
    end
  end
end
P = Parser.new('https://en.wikipedia.org/wiki/Nokogiri_(software)')
