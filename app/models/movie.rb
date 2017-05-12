class Movie
  attr_accessor :title, :ratings

  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    @@all.find { |movie| movie.title == title }
  end

  def ratings
    Rating.all.map do |rating|
      if rating.movie == self
        rating
      end
    end
  end

  def viewers
    viewers = ratings.map do |rating|
      rating.viewer
    end
    
    # should not return duplicate viewers (with multiple reviews)
    viewers.uniq
  end

  def average_rating
    total = 0
    count = 0

    ratings.map do |rating|
      count += 1
      total += rating.score
    end

    total.to_f/count.to_f
  end
end
