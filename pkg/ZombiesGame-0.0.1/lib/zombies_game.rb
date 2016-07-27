require './zombies.rb'
require './humans.rb'
require './dogs.rb'
require './guns.rb'

module ZombiesGame
  def initialize_game
    puts "Enter max zombies number"
    max_zombies = gets
    puts "Enter max humans number"
    max_humans = gets
    puts "Enter max dogs number"
    max_dogs = gets
    puts "Enter max guns number"
    max_guns = gets

    $killed_zombies = []
    $konverted_humans = []
    zombies = []
    humans = []
    dogs = []
    guns = []
    for x in 1..rand(1..max_zombies.chomp.to_i) do
      zombies << Zombie.new("Zumbie #{x}")
    end
    for x in 1..rand(1..max_humans.chomp.to_i) do
      humans << Human.new("Human #{x}")
    end
    for x in 1..rand(1..max_dogs.chomp.to_i) do
      dogs << Dog.new("Dog #{x}")
    end
    for x in 1..rand(1..max_guns.chomp.to_i) do
      guns << Gun.new("Gun #{x}")
    end
    puts "There are #{zombies.count} zombies in the game."
    puts "There are #{humans.count} humans in the game."
    puts "There are #{dogs.count} dogs in the game."
    puts "There are #{guns.count} guns in the game."
    begin_game(zombies, humans, dogs, guns)
    print_results(zombies, humans, dogs, guns)
  end

  def begin_game(zombies, humans, dogs, guns)
    while(zombies.count >= 1 and humans.count >= 1) do 
      zombies.each_with_index do |zombie, zombie_index|
        kill_zombie_by_dog, kill_zombie_by_human = false
        object = nil
        humans.each_with_index do |human, human_index|
          kill_zombie_by_dog, object = search_for_closest_dogs(dogs, zombie)
          if zombie.x.between?(human.x - 3, human.x + 3) and zombie.y.between?(human.y - 3, human.y + 3)
            give_human_warning(human, zombie)
            if zombie.x.between?(human.x - 1, human.x + 1) and zombie.y.between?(human.y - 1, human.y + 1) or (zombie.x == human.x and zombie.y == human.y)
              guns.each do |gun|
                if (gun.x == human.x and gun.y == human.y)
                  object = human
                  kill_zombie_by_human = true
                  human.has_gun(gun)
                else
                  human.has_become_a_zombie
                  $konverted_humans << human
                  zombies << Zombie.new("Zombie (#{human.name})", human.x, human.y)
                  break if humans.delete_at(human_index)
                end
              end
            end
          end
          human.run
        end
        kill_or_move_zombie(kill_zombie_by_dog, kill_zombie_by_human, zombie, zombie_index, zombies, object)
        break if (kill_zombie_by_dog or kill_zombie_by_human)
      end
    end
  end

  def search_for_closest_dogs(dogs, zombie)
    dogs.each do |dog|
      if zombie.x.between?(dog.x - 2, dog.x + 2) and zombie.y.between?(dog.y - 2, dog.y + 2)
        return true, dog
        break
      end
      dog.run
    end
  end
  
  def give_human_warning(human, zombie)
    human.warning!
    zombie.say_brains
    human.ask_for_help
    zombie.get_zombie_info
    human.get_human_info
  end

  def kill_or_move_zombie(kill_zombie_by_dog = false, kill_zombie_by_human = false, zombie, zombie_index, zombies, object)
    if kill_zombie_by_dog
      zombie.killed_by_dog(object)
      $killed_zombies << zombie
      zombies.delete_at(zombie_index)
    elsif kill_zombie_by_human
      zombie.killed_by_human(object)
      $killed_zombies << zombie
      zombies.delete_at(zombie_index)
    else
      zombie.walk
    end
  end

  def print_results(zombies, humans, dogs, guns)
    p "LEFT ZOMBIES #{zombies.count}"
    p zombies.collect(&:name)
    p "LEFT HUMANS #{humans.count}"
    p humans.collect(&:name)
    p "CONVERTED HUMANS #{$konverted_humans.count}"
    p $konverted_humans.collect(&:name) 
    p "KILLED SOMBIES #{$killed_zombies.count}"
    p $killed_zombies.collect(&:name) 
  end
  
end