# Creator
class GameFactory
  def initialize(number_of_games)
    @games = Array.new
    number_of_games.times do
      @games << create_game
    end
  end

  def ship_out
    @games
  end
end

# ConcreteCreator1
class ActionGameFactory < GameFactory
  def create_game
    ActionGame.new
  end
end

# ConcreteCreator2
class AdventureFactory < GameFactory
  def create_game
    AdventureGame.new
  end
end

# Product1
class ActionGame
  def play
    puts "Playing a action game."
  end
end

# Product2
class AdventureGame
  def play
    puts "Playing a adventure game."
  end
end


############## Usage ##############
action_factory = ActionGameFactory.new(2)
action_games = action_factory.ship_out
action_games.each { |action_game| action_game.play }
#=> Playing a action game.
#=> Playing a action game.

adventure_factory = AdventureFactory.new(3)
adventure_games = adventure_factory.ship_out
adventure_games.each { |adventure_game| adventure_game.play }
#=> Playing a adventure game.
#=> Playing a adventure game.
#=> Playing a adventure game.