class Rating
  attr_accessor :score, :movie, :viewer

  @@all = []

  def initialize(score, movie)
    @score = score
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end
end
