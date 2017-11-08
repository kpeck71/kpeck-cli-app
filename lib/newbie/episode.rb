class Newbie::Episode
  attr_accessor :title, :short_des, :url, :date, :content
  @@all = []
  
  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
