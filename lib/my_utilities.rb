require 'nokogiri'
require 'httparty'

module MyUtilities
  def scrapper(string)
    name = string.split(' ').join('+')
    url = "https://staticice.com.au/cgi-bin/search.cgi?q=#{name}+site:mwave+price:500"

    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    video_cards = parsed_page.css('table table table table table tr:nth-child(n+4)')
    first_card = video_cards.first

    gpu = {
      price: first_card.css('a')[0].text,
      url: (CGI.unescape(first_card.css('a')[0].attributes["href"].value.split('newurl=')[1])).split(/(\u0026)/)[0]
    }
  end
end
