class Turn
    attr_reader :current_player,:other_player, :round, :num_1, :num_2, :result
    def initialize current_player, other_player, round
      @current_player = current_player
      @other_player = other_player
      @round = round
      @num_1 = rand(20) + 1
      @num_2 = rand(20) + 1
      @result = @num_1 + @num_2
    end
end