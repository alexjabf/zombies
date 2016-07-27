class Zombie
  attr_accessor :name, :x, :y
  def initialize(name, x = rand(1..10), y = rand(1..10))
    @name = name
    @x = x
    @y = y
  end
  
  def walk
    self.x = self.x + [-1, 1, 0].sample
    self.y = self.y + [-1, 1, 0].sample
  end
  
  def say_brains
    puts "#{self.name.upcase} SAYS BRAINNSS!!!!"
  end
  
  def killed_by_dog(dog)
    puts "#{self.x}, #{self.y } --- #{dog.x}, #{dog.y}---------------------------------------------------------------------------------------------------------"
    puts "#{self.name.upcase} HAS BEEN KILLED BY #{dog.name.upcase}!!!!" unless dog.nil?
  end
  
  def killed_by_human(human)
    puts "#{self.name.upcase} HAS BEEN KILLED BY #{human.name.upcase}!!!!"
  end
  
  def get_zombie_info
    puts "#{self.name.upcase} is at (#{self.x}, #{self.y})"
  end
end