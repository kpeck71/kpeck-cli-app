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
      else
        puts "This is not a valid episode number."
      end
        answer = gets.strip
        case answer
        when "more"
          episode.content
          puts "\nWould you like to see the full episode list again? Enter 'list'."
          puts "Or enter 'exit'."
            answer2 = gets.strip #downcase?
            case answer2
            when "list"
              print_episodes
              puts "Please enter an episode number."
            when "exit"
              exit
            end
        when "list"
          print_episodes
          puts "Please enter an episode number."
        when "exit"
          exit
        else
          "That doesn't look like a valid entry. Please enter an episode number, 'list', or 'exit'."
        end
      end
    end
  end
end
