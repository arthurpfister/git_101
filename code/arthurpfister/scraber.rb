require "open-uri"
require "nokogiri"
require "pry-byebug"
BASE_URL = "https://www.imdb.com"

def fetch_urls
  url = "https://www.imdb.com/chart/top"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  urls = []
  movie_list = html_doc.search(".titleColumn a").each do |element|
    suburl_with_query = element["href"] #this is a string
    match_data = suburl_with_query.match(/(.+)(\?.+)/)
    suburl = match_data[1] #this is a string
    urls << BASE_URL + suburl #string contatenation
  end

  p urls.take(5)

end
