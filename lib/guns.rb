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