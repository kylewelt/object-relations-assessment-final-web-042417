# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  attr_accessor :first_name, :last_name, :ratings

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |viewer| viewer.full_name == name }
  end

  def create_rating(score, movie)
    rating = Rating.new(score, movie)
    rating.viewer = self
  end
end


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
