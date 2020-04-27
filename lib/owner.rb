class Owner

attr_reader :name, :species
@@all=[]

def initialize(name,species="human")
  @name=name
  @species=species
  @@all << self
end

def say_species
  "I am a #{@species}."
end

def self.all
  @@all
end

def self.count
  Owner.all.count
end

def self.reset_all
  Owner.all.clear
end

def cats
  Cat.all.select do |cat|
    cat.owner == self
  end
end

def dogs
  Dog.all.select do |dog|
    dog.owner == self
  end
end

def buy_cat(name)
  Cat.new(name,self)
end

def buy_dog(name)
  Dog.new(name,self)
end

def walk_dogs
  Dog.all.select do |dog|
    if dog.owner == self
      dog.mood = "happy"
    end
end
end

def feed_cats
  Cat.all.select do |cat|
    if cat.owner == self
      cat.mood = "happy"
    end
end
end

def sell_pets

  all_pets = self.dogs + self.cats
  all_pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end


end
