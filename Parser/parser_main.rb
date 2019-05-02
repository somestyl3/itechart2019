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
        require 'open-uri'
        require 'nokogiri'

        html = open(@url)

        doc = Nokogiri::HTML(html)

        links = doc.css('a')
        url = links.map { |url| url['href'] }
        title = links.map { |title| title['title'] }
        content = links.map { |content| content.text } 
        
        
        parsed={
            url: url,
            title: title,
            content: content
        }

        Save.new(parsed)
    
    end
end


class Save
def initialize(**args)
    require 'yaml'

    if true
    File.open("/home/viachaslau/Documents/itechartgit/Parser/parsed_data.yml", "w") do |file|
      file.write args.to_yaml
    end
    puts "Saved to file"
else
    puts "Saving error!"
end
end

end
  P=Parser.new("https://en.wikipedia.org/wiki/Nokogiri_(software)")
  