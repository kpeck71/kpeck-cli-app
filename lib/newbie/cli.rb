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
        puts "\nIf you would like to learn more about this episode, enter 'more'. To see full list, enter 'list', or type 'exit'."
        input = gets.strip
          if input == "more"
              episode.content
              #puts "Would you like to listen to this episode? Enter 'listen'"
              puts "Would you like to see the full episode list again? Enter 'list'."
              puts "Or enter 'exit'."
          elsif input == "list"
            print_episodes
            options
          else input == "exit"
            exit
          end
      end
    end
  end
end
