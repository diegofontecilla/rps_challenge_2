class GameSession

  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def self.create(player_1, player_2)
    @game_session = GameSession.new(player_1, player_2)
  end

  def self.instance
    @game_session
  end
end
