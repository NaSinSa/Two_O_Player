class Player
  attr_reader :name, :hp

  def initialize(name)
      @name=name
      @hp=3
  end

  
  def quiz(enemy)
    a = rand(1..20)
    b = rand(1..20)
    puts "#{@name}: What does #{a} plus #{b} equal?"
    print ">"
    answer = $stdin.gets.chomp

    if answer == (a + b).to_s
      puts "#{@name}: YES! You are correct."
    else
      puts "#{@name}: Seriously? No!"
      enemy.minus_one_point
    end
  end

  def minus_one_point
    @hp -= 1
  end

  def lose?
    @hp <= 0
  end
end