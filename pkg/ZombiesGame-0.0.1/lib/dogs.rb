class Dog
  attr_accessor :name, :x, :y
  def initialize(name, x = rand(1..10), y = rand(1..10))
    @name = name
    @x = x
    @y = y
  end
  
  def run
    self.x = self.x + [-2, 2, 0].sample
    self.y = self.y + [-2, 2, 0].sample
  end
  
  def get_dog_info
    puts "#{self.name} is at (#{self.x}, #{self.y})"
  end
end

class Gun
  attr_accessor :name, :x, :y
  def initialize(name, x = rand(1..200), y = rand(1..200))
    @name = name
    @x = x
    @y = y
  end
  def get_gun_info
    puts "#{self.name} is at (#{self.x}, #{self.y})"
  end
end
