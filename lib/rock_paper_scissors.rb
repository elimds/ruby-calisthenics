class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
      rules = {"R" => {"R" => 1, "P" => 2, "S" => 1},
        "P" => {"R" => 1, "P" => 1, "S" => 2},
        "S" => {"R" => 2, "P" => 1, "S" => 1}}
      
      res = rules[player1[1]][player2[1]]
      
      if res.nil? || res < 1
        raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
      end
      
      if (res == 1)
        return player1
      else
        return player2
      end
  end

  def self.tournament_winner(tournament)
    if (tournament[0][0].is_a?(String))
      return self.winner(tournament[0], tournament[1])
    end
    self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
  end

end
