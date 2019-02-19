require_relative './turn'
    class TurnManager
        def initialize players
            @players = players.dup
            @round_number = 0
            @current_player = @players[1]
            @other_player = nil
        
        end

        def next_turn
            increment_turn
            turn = Turn.new(@current_player,@other_player,@round_number)
            #  print out a round header
             puts ""
             puts "==== New Turn ##{turn.round} ====="
             puts ""
            
            puts "#{turn.current_player.name}: What does #{turn.num_1} plus #{turn.num_2} equal "
            answer = gets.chomp.to_i
                if turn.result != answer
                    puts "#{turn.current_player.name}: Seriously? No"
                    turn.current_player.loss_of_lives
                else 
                    puts "#{turn.current_player.name}: YES!, you are correct"

                end
        end

        def get_other_player(current_player)
            @players.select {|p| p != current_player && !p.dead? }.first
        end
          
        private

        def increment_turn
            @round_number += 1
            temp = @current_player
            @other_player = temp
            @current_player= get_other_player @current_player
        end
end