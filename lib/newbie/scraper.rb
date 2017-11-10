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
    puts "--------------- Episode Description ---------------"
    #@doc.search(".medium-8.large-8.columns.card p").text
    puts "Here is a fake description until I figure out how to scrape pages that have different layouts."
    puts "--------------- About the Guest ---------------"
    puts "Guest Name"
    puts "Guest detail paragraph"
    #@doc.search(".columns.medium-4.large-4 h4").text.strip
    puts "Contact Details:"
    #@doc.search("a.social-link").attr("href").value
    puts "Here is another part of the episode page I could add with the guest paragraph."
  end

end
