require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

  def test_it_scores_doubles #test_4: WIP
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end
  
end
