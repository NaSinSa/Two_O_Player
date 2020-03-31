require_relative './player'

class Game

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
  end

  def display_round_status
    puts "P1: #{@player1.hp}/3 VS P2: #{@player2.hp}/3"
    puts "----- NEW TURN -----"
  end

  def display_winner
    puts "#{alive_players.first.name} wins with a score of #{alive_players.first.hp}/3" 
    puts "----- GAME OVER -----"
    puts "Good bye!"

  end

  def alive_players
    @players.select{|player| !player.lose?}
  end

  def next_round
    sleep 1
    @players.rotate!
  end

  def game_over?
    alive_players.count == 1
  end
  
  def get_current_player
    alive_players.first
  end

  def get_enemy_player(current)
    alive_players.select{|player| player != current}.sample
  end

  
  def play

    until(game_over?) do

      current_player = get_current_player
      enemey_player = get_enemy_player(current_player)

      current_player.quiz(enemey_player)


      display_round_status
      
      next_round

    end

    display_winner

  end

end