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
      puts " "
      puts "Which episode would you like to learn more about? Please enter the episode number:"
      num_episodes = TestingCli::Episode.all.size
      answer = gets.strip
      if answer.to_i <= num_episodes && answer.to_i != 0
        episode = TestingCli::Episode.all[-(answer.to_i)] #make sure 0 is not a valid entry
        puts "#{episode.title}"
        puts "#{episode.short_des}"
        puts "\nIf you would like to learn more about this episode, enter 'more'. To see full list of episodes again, enter 'list', or type 'exit'."
        puts " "
      elsif 0 || answer > num_episodes || answer !="exit"
        puts "This is not a valid entry. Please enter restart to try again."
      elsif answer == "exit"
        exit
      end
      #else "not a valid entry. How to get it to restart and accept other episode numbers?"
      input = gets.strip
      case input
      when "more"
          episode.content
          puts "\nWould you like to see the full episode list again? Enter 'list'."
          puts "Or enter 'exit'."
            answer2 = gets.strip #downcase?
            if answer2 == "list"
              print_episodes
              puts "Please enter an episode number."
            else answer2 == "exit"
              exit
            end
      when "list"
          print_episodes
          puts "Please enter an episode number."
      when "exit"
        exit
      else
          "That doesn't look like a valid entry. Please enter a valid episode number, 'list', or 'exit'."
      end
    end
  end

end
end
