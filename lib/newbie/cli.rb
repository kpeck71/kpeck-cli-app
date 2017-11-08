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
    input = nil
    while input != "exit"
      puts "Which episode would you like to learn more about? Please enter the episode number:"
      number = gets.strip
      if number.to_i <= TestingCli::Episode.all.size
        episode = TestingCli::Episode.all[-(number.to_i)]
        puts "#{episode.title}"
        puts "#{episode.short_des}"
      end
    end
  end
end
