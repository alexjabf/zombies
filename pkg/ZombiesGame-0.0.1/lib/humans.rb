class Human
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
  
  def warning!
    puts "RUN #{self.name.upcase} YOU ARE IN DANGER ZOMBIE IS CLOSE!!!!!"
  end
  
  def ask_for_help
    puts "#{self.name.upcase} SAYS HELP ME!!!!!"
  end
  
  def has_become_a_zombie
    puts "#{self.name.upcase} HAS BECOME A ZOMBIE :("
  end
  
  def has_gun(gun)
    puts "#{self.name.upcase} HAS #{gun.name.upcase} :D"
  end
  
  def get_human_info
    puts "#{self.name} is at (#{self.x}, #{self.y})"
  end
end