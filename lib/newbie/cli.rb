class Newbie::CLI
  def call
    Newbie::Scraper.new.scrape_episodes
    puts "Welcome to the Code Newbie podcast episode guide!"
    options
  end

  def print_episodes
    Newbie::Episode.all.each do |ep|
      puts ep.title
    end
  end

 def options
    input = nil
    num_episodes = Newbie::Episode.all.size
    while input != "exit"
      puts "\nWhich set of episodes would like to like to see? Enter 1-50, 51-100, 101-150, or 151 and up."
      puts "For a full list of all #{num_episodes} episodes, enter 'list'."
      input = gets.strip #this changes a string like "1-50" to the integer 1
      if input != "list"
        list_episode_range(input.to_i)
        puts "\nWhich episode would you like to learn more about? Please enter the episode number:"
        input = gets.strip
        if  input == "0" || input.to_i > num_episodes
          puts "This is not a valid entry. Please enter restart to try again."
        else input.to_i <= num_episodes && input.to_i != 0 #make separate list_episode method?
          episode = Newbie::Episode.all[-(input.to_i)] #make sure 0 is not a valid entry
          puts "#{episode.title}"
          puts "#{episode.short_des}"
          puts "\nIf you would like to learn more about this episode, enter 'more' or type 'exit'."
          puts " "
        end
        input = gets.strip.downcase
        if input == "more"
          episode.content
          "Would you like to see more episodes? Enter 'Y' or exit."
        end

      else input.downcase == "list"
          print_episodes
      end
    end
    puts "See you next time, newbie"
  end

  def list_episode_range(range)
     puts "Episodes ranging from #{range} to #{range+50}"
     puts " "
     Newbie::Episode.all.reverse[range-1, 50].each do |episode|
       puts "#{episode.title}"
     end
   end

  #  def list_episode(number)
  #
  #  end
end
