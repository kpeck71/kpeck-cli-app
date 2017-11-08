class Newbie::CLI
  def call
    puts "Testing 1-2-3"
    Newbie::Scraper.new.scrape_episodes
    print_episodes
    options
  end

  def print_episodes
    Newbie::Episode.all.each do |ep|
      puts ep.title
    end
  end
  
  def options
    puts "option test"
  end
end
