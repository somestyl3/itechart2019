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

  def parse(url)
    html = open(@url)
    doc = Nokogiri::HTML(html)

    links = doc.css('a')
    url = links.map { |url| url['href'] }
    title = links.map { |title| title['title'] }
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
    File.open('/home/viachaslau/Documents/itechartgit/Parser/parsed_data.yaml', 'w') do |file|
        file.write args.to_yaml
        puts 'Saved to file'
      end
  end
end
P = Parser.new('https://en.wikipedia.org/wiki/Nokogiri_(software)')
