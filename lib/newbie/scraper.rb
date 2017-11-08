class Newbie::Scraper
  def scrape_episodes
    @doc = Nokogiri::HTML(open("https://www.codenewbie.org/podcast"))
    @doc.search("article").each do |eps|
      episode = Newbie::Episode.new
      episode.title = eps.search("a h3").text
      episode.short_des = eps.search(".small-12.medium-8.large-12.columns p").text
      episode.url = eps.search("a").attr("href").value
      episode.date = eps.search(".subtitle").text
      episode.save
    end
  end
  
  def scrape_details
    @doc = Nokogiri::HTML(open("https://www.codenewbie.org#{@url}"))
    puts "Here is a fake description until I figure out this dang scraping. Not all the episode pages have the same layouts. Oh nooooo!"
  end
  
end
