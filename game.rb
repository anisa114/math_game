require_relative './player'
require_relative './turn_manager'

class Game 

    #Our two players
    def initialize 
        # Our list of players/robots
        @players = [       
            Player.new("Player 1"),
            Player.new("Player 2"),
        ]

        @turn_manager = TurnManager.new(@players)
    end
    
    def play 
        while(not game_over?) do
            # get the next turn from the turn_manager
            @turn_manager.next_turn
            score_summary
        end
        end_game_summary
    end

    # Helper method to tell when the game is over
     def game_over?
        alive_players.count == 1
    end

    # Helper method to get all the alive robots
    #Returns array that match the condition not dead
    def alive_players
        @players.reject{|p| p.dead? }
  end

  def score_summary 
    string = ''
    count = 1
    @players.each do |player|
        string +=  "P#{count}: #{player.lives}/3 "
        count+=1
    end
    puts string
  end

  def end_game_summary
    winner = alive_players[0]
    puts "#{winner.name} Wins! with a score of #{winner.lives}/3"
    puts ""
    puts "------GAME OVER--------"
    puts "Goodbye!"
  end

end