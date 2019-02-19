class Player 
    attr_reader :name, :lives

    def  initialize name
        @name = name
        @lives = 3
    end

    # A player is dead if they have zero lives
    def dead?
        @lives <=0
    end

    def loss_of_lives 
        @lives -= 1
    end


end