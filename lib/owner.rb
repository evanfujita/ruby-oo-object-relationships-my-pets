require 'pry'

class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    name = Cat.new(name, self)
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.map {|cat| cat.mood = "nervous"}
    self.cats.map {|cat| cat.owner = nil}
    self.dogs.map {|dog| dog.mood = "nervous"}
    self.dogs.map {|dog| dog.owner = nil}
  end

  def list_pets
    cats = self.cats.count
    dogs = self.dogs.count
    "I have #{dogs} dog(s), and #{cats} cat(s)."
  end

end